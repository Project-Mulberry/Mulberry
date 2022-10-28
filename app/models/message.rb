require 'date'

class Message < ActiveRecord::Base

  def self.get_message_list()

  end

  # @param  int(sender uid)
  # @param  int(receiver uid)
  # @param  string(actual message)
  # @return None
  def self.post_message(sender_uid, receiver_uid, message)
    message = {:sender_id => sender_uid,
               :receiver_id => receiver_uid,
               :timestamp => DateTime.new,
               :message => message,
               :is_read => false}
    Message.create!(message)
  end

  PULL_MESSAGE_BASE_SQL_QUERY =
    "SELECT * FROM messages WHERE (sender_id = '?' AND receiver_id = '?') OR (sender_id = '?' AND receiver_id = '?') ORDER BY timestamp DESC"

  # @param  int(current login uid)
  # @param  int(uid who is messaging the current user)
  # @return list(Message)
  def self.pull_message(current_uid, interactive_uid)
    sql = Helper.generate_query(PULL_MESSAGE_BASE_SQL_QUERY, [current_uid, interactive_uid, interactive_uid, current_uid])
    messages = ActiveRecord::Base.connection.execute(sql)
    # update is_read attribute if the receiver is the current user
    messages.each do |message|
      if message.receiver_id == current_uid and not message.is_read
        message.is_read = true
        message.save
      end
    end
    return messages
  end
end
