require 'rails_helper'

RSpec.describe Coupon, type: :model do
  before :each do
    @uid1 = User.create!({:phone => '1234567890', :password => '12345678'})[:uid]
    @uid2 = User.create!({:phone => '1234567891', :password => '12345678'})[:uid]
    @uid3 = User.create!({:phone => '1234567892', :password => '12345678'})[:uid]
    Interest.create!({:uid => @uid, :interest1 => 'interest-1', :interest2 => 'interest-2', :interest3 => 'interest-3'})
    Interest.create!({:uid => @uid, :interest1 => 'interest-1', :interest2 => 'interest-2', :interest3 => 'interest-3'})
    Interest.create!({:uid => @uid, :interest1 => '1', :interest2 => '2', :interest3 => '3'})
    Coupon.create!({:name => 'interest-1'})
    Coupon.create!({:name => 'interest-2'})
    Coupon.create!({:name => 'interest-3'})
    Coupon.create!({:name => 'food'})
  end

  context 'auto find a random coupon based on two users' do
    it 'find a matched interest of two users' do
      expect(Coupon.coupon_recommend(@uid1, @uid2).nil?).to eq(false)
    end
  end
end
