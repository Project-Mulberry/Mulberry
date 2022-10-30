require 'rails_helper'


RSpec.describe User, type: :model do
  context 'create a user' do
    it 'created with valid phone and password -> Success' do
      user = User.create_new_user('1234567890', '12345678')
      expect(user[:phone]).to eq('1234567890')
      expect(user[:password]).to eq('12345678')
    end
    it 'created with invalid phone -> Fail' do
      user = User.create_new_user('invalid phone number', '12345678')
      expect(user).to eq(nil)
    end
    it 'created with already existed phone -> Fail' do
      user = User.create_new_user('1234567890', '12345678')
      expect(user[:phone]).to eq('1234567890')
      expect(user[:password]).to eq('12345678')
      user = User.create_new_user('1234567890', '12345678')
      expect(user).to eq(nil)
    end
  end

  context 'find a user' do
    it 'find with an existing user' do
      User.create_new_user('1234567890', '12345678')
      user = User.find_user_by_phone('1234567890')
      expect(user.any?).to eq(true)
    end
    it 'find with an non-existing user' do
      user = User.find_user_by_phone('1234567890')
      expect(user.any?).to eq(false)
    end
  end

  context 'verify user phone and password pair' do
    it 'verify an existing phone and password pair -> Success' do
      User.create_new_user('1234567890', '12345678')
      result = User.verify_phone_and_password('1234567890', '12345678')
      expect(result).to eq(true)
    end
    it 'verify with an invalid phone -> Fail' do
      result = User.verify_phone_and_password('invalid phone number', '12345678')
      expect(result).to eq(false)
    end
    it 'verify with an non-existing phone -> Fail' do
      result = User.verify_phone_and_password('0987654321', '12345678')
      expect(result).to eq(false)
    end
  end

  # context 'update user info' do
  #   it 'Successfully' do
  #     User.create_new_user('1234567890', '12345678')
  #     user = User.find_user_by_phone('1234567890').first
  #     user[:name] = 'Marcus'
  #     User.update_user_info(user)
  #     expect(User.find_user_by_phone('1234567890').first.name).to eq('Marcus')
  #   end
  # end
end
