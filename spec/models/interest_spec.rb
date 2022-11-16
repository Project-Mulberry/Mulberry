require 'rails_helper'

RSpec.describe Interest, type: :model do
  before :each do
    @user = User.create!({:phone => '1234567890', :password => '12345678'})
    @uid = @user[:uid]
  end

  context 'get interests by uid' do
    it 'Successfully' do
      interest = Interest.get_interests_by_uid(@uid)
      expect(interest.nil?).to eq(true)
    end
  end

  context 'update interests' do
    it 'Successfully' do
      Interest.create!({:uid => @uid, :interest1 => '', :interest2 => '', :interest3 => ''})
      interest = Interest.get_interests_by_uid(@uid)
      interest.update!({:interest1 => 'some interests'})
      interest = Interest.get_interests_by_uid(@uid)
      expect(interest.nil?).to eq(false)
      expect(interest.interest1.nil?).to eq(false)
      expect(interest.interest1).to eq('some interests')
    end
  end

end
