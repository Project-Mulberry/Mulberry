require 'rails_helper'

RSpec.describe Interest, type: :model do
  before :each do
    @user = User.create_new_user('1234567890', '12345678')
    @uid = @user[:uid]
  end

  context 'get interests by uid' do
    it 'Successfully' do
      interest = Interest.get_interests_by_uid(@uid)
      expect(interest.nil?).to eq(false)
      expect(interest.interest1.nil?).to eq(false)
      expect(interest.interest1).to eq('')
    end
  end

  context 'update interests' do
    it 'Successfully' do
      interest = Interest.get_interests_by_uid(@uid)
      interest.interest1 = 'some interests'
      Interest.update_interest(interest)
      interest = Interest.get_interests_by_uid(@uid)
      expect(interest.nil?).to eq(false)
      expect(interest.interest1.nil?).to eq(false)
      expect(interest.interest1).to eq('some interests')
    end
  end

end
