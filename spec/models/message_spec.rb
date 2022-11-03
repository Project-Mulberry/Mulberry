require 'rails_helper'

RSpec.describe Message, type: :model do
  before :each do
    @uid1 = User.create_new_user('1234567890', '12345678')[:uid]
    @uid2 = User.create_new_user('1234567891', '12345678')[:uid]
  end

  context 'post a method' do
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

      m_send = Message.pull_send_message_by_id(@uid1)
      m_receive = Message.pull_receive_message_by_id(@uid1)
      expect(m_send.nil?).to eq (false)
      expect(m_receive.nil?).to eq (false)

      expect(messages.nil?).to eq(false)
      expect(messages.count).to eq(2)
      expect(messages.first['message']).to eq('This is a message')
      expect(messages[1]['is_read']).to eq(1)
    end
  end

end
