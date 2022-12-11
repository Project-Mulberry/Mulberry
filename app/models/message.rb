require 'date'

class Message < ActiveRecord::Base
  PULL_MESSAGE_LIST_BASE_SQL_QUERY =
    "SELECT m.sender_uid, m.receiver_uid, m.key, m.timestamp, m.message, m.is_read
FROM
    (SELECT key, MAX(timestamp) as timestamp
    FROM messages
    WHERE key LIKE '%<?>%'
    GROUP BY key
    ORDER BY timestamp DESC) temp, messages m
WHERE temp.key = m.key AND temp.timestamp = m.timestamp"
    # "SELECT sender_uid, receiver_uid, key, MAX(timestamp) as timestamp, message, is_read FROM messages WHERE key LIKE '%<?>%' GROUP BY key ORDER BY timestamp DESC"

  # @param  int(uid)
  # @return List(Message), the last message record related to this uid with different user
  def self.get_message_list(uid)
    sql = Helper.generate_query(PULL_MESSAGE_LIST_BASE_SQL_QUERY, [uid.to_s])
    messages = ActiveRecord::Base.connection.execute(sql).to_a
    return messages
  end

  def self.generate_key(sender_uid, receiver_uid)
    if sender_uid < receiver_uid
      return '<' + sender_uid.to_s + '>-<' + receiver_uid.to_s + '>'
    else
      return '<' + receiver_uid.to_s + '>-<' + sender_uid.to_s + '>'
    end
  end

  PULL_DISTINCT_MESSAGE_BASE_SQL_QUERY = "SELECT COUNT(*) FROM messages WHERE key = '?' GROUP BY sender_uid"
  def self.post_message(sender_uid, receiver_uid, message)
    message = {:sender_uid => sender_uid,
               :receiver_uid => receiver_uid,
               :key => generate_key(sender_uid, receiver_uid),
               :timestamp => DateTime.now(),
               :message => message,
               :is_read => false}
    message = Message.create!(message)

    # check if we need to create an activity
    key = generate_key(sender_uid, receiver_uid)
    sql = Helper.generate_query(PULL_DISTINCT_MESSAGE_BASE_SQL_QUERY, [key])
    result = ActiveRecord::Base.connection.execute(sql).to_a
    activities = Activity.pull_dual_activities(sender_uid, receiver_uid)
    if result.length > 1 and activities.empty?
      Activity.create_new_activity(sender_uid, receiver_uid)
    end

    message
  end

  PULL_MESSAGE_BASE_SQL_QUERY =
    "SELECT * FROM messages WHERE (sender_uid = ? AND receiver_uid = ?) OR (sender_uid = ? AND receiver_uid = ?) ORDER BY timestamp ASC"
  UPDATE_MESSAGE_IS_READ_BASE_SQL_QUERY =
    "UPDATE messages SET is_read = 't' WHERE receiver_uid = ? AND sender_uid = ?"

  # @param  int(current login uid)
  # @param  int(uid who is messaging the current user)
  # @return list(Message)
  def self.pull_message(current_uid, interactive_uid)
    # update is_read attribute if the receiver is the current user
    update_is_read_sql = Helper.generate_query(UPDATE_MESSAGE_IS_READ_BASE_SQL_QUERY, [current_uid.to_s, interactive_uid.to_s])
    ActiveRecord::Base.connection.execute(update_is_read_sql)
    # obtain updated records
    sql = Helper.generate_query(PULL_MESSAGE_BASE_SQL_QUERY, [current_uid.to_s, interactive_uid.to_s, interactive_uid.to_s, current_uid.to_s])
    messages = ActiveRecord::Base.connection.execute(sql).to_a
    return messages
  end
end
