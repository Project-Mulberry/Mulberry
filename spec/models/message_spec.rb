require 'rails_helper'

RSpec.describe Message, type: :model do
  before :each do
    @uid1 = User.create_new_user('1234567890', '12345678')[:uid]
    @uid2 = User.create_new_user('1234567891', '12345678')[:uid]
  end

  context 'post a message' do
    it 'Successfully' do
      message = Message.post_message(@uid1, @uid2, 'This is a message')
      expect(message.nil?).to eq(false)
      expect(message.message).to eq('This is a message')
    end
  end

  context 'pull messages based on two uids' do
    it 'Successfully' do
      Message.post_message(@uid1, @uid2, 'This is a message')
      Message.post_message(@uid2, @uid1, 'This is a response message')
      messages = Message.pull_message(@uid1, @uid2)

      expect(messages.nil?).to eq(false)
      expect(messages.count).to eq(2)
      expect(messages.first['message']).to eq('This is a message')
      expect(messages.first['is_read']).to eq('f')
      expect(messages[1]['is_read']).to eq('t')
    end
  end

  context 'pull the last message with each interactive user by current user id' do
    it 'Successfully' do
      Message.post_message(@uid2, @uid1, 'Message - 1')
      Message.post_message(@uid1, @uid2, 'Message - 2')
      Message.post_message(@uid2, @uid1, 'Message - Last')

      messages = Message.get_message_list(@uid1)
      expect(messages.nil?).to eq(false)
      expect(messages.count).to eq(1)
      expect(messages.first['sender_uid']).to eq(@uid2)
      expect(messages.first['receiver_uid']).to eq(@uid1)
      expect(messages.first['key']).to eq('<'+@uid1.to_s+'>-<'+@uid2.to_s+'>')
      expect(messages.first['is_read']).to eq('f')
      expect(messages.first['message']).to eq('Message - Last')
    end
  end

end
