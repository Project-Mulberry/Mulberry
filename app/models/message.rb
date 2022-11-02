require 'date'

class Message < ActiveRecord::Base

  # TODO
  # PULL_MESSAGE_LIST_BASE_SQL_QUERY =
  #   "SELECT DISTINCT() FROM messages WHERE sender_id = ? OR receiver_id = ? ORDER BY timestamp DESC"
  #
  # # @param  int(uid)
  # # @return List(uid) all uids who ever interact with current user
  # def self.get_message_list(uid)
  #   sql = Helper.generate_query(PULL_MESSAGE_LIST_BASE_SQL_QUERY, [uid.to_s])
  #   messages = ActiveRecord::Base.connection.execute(sql)
  #   # update is_read attribute if the receiver is the current user
  #   messages.each do |message|
  #     if message.receiver_id == current_uid and not message.is_read
  #       message.is_read = true
  #       message.save
  #     end
  #   end
  #   return messages
  # end
  # @param  int(sender uid)
  # @param  int(receiver uid)
  # @param  string(actual message)
  # @return Message

  # additional method for chat_list: retrieve all message send/received by someone using uid
  def self.pull_send_message_by_id(uid)
    return Message.where(sender_uid: uid).all
  end

  def self.pull_receive_message_by_id(uid)
    return Message.where(receiver_uid: uid).all
  end

  def self.post_message(sender_uid, receiver_uid, message)
    message = {:sender_uid => sender_uid,
               :receiver_uid => receiver_uid,
               :timestamp => DateTime.new,
               :message => message,
               :is_read => false}
    return Message.create!(message)
  end

  PULL_MESSAGE_BASE_SQL_QUERY =
    "SELECT * FROM messages WHERE (sender_uid = ? AND receiver_uid = ?) OR (sender_uid = ? AND receiver_uid = ?) ORDER BY timestamp DESC"
  UPDATE_MESSAGE_IS_READ_BASE_SQL_QUERY =
    "UPDATE messages SET is_read = true WHERE receiver_uid = ? AND sender_uid = ?"

  # @param  int(current login uid)
  # @param  int(uid who is messaging the current user)
  # @return list(Message)
  def self.pull_message(current_uid, interactive_uid)
    # update is_read attribute if the receiver is the current user
    update_is_read_sql = Helper.generate_query(UPDATE_MESSAGE_IS_READ_BASE_SQL_QUERY, [current_uid.to_s, interactive_uid.to_s])
    ActiveRecord::Base.connection.execute(update_is_read_sql)
    # obtain updated records
    sql = Helper.generate_query(PULL_MESSAGE_BASE_SQL_QUERY, [current_uid.to_s, interactive_uid.to_s, interactive_uid.to_s, current_uid.to_s])
    messages = ActiveRecord::Base.connection.execute(sql)
    return messages
  end
end
