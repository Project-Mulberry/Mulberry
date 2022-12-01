require 'rails_helper'

RSpec.describe Activity, type: :model do
  before :each do
    @uid1 = User.create!({:phone => '1234567890', :password => '12345678'})[:uid]
    @uid2 = User.create!({:phone => '1234567891', :password => '12345678'})[:uid]
    Interest.create!({:uid => @uid, :interest1 => 'interest-1', :interest2 => 'interest-2', :interest3 => 'interest-3'})
    Interest.create!({:uid => @uid, :interest1 => 'interest-1', :interest2 => 'interest-2', :interest3 => 'interest-3'})
    Coupon.create!({:name => 'food'})
  end

  context 'create new activity' do
    it 'Successfully' do
      activity = Activity.create_new_activity(@uid1, @uid2)
      expect(activity.nil?).to eq(false)
      expect(activity.status).to eq('PENDING')
    end
  end

  context 'pull all activities by two uids' do
    before :each do
      Activity.create_new_activity(@uid1, @uid2)
      Activity.create_new_activity(@uid2, @uid1)
    end
    it 'Successfully' do
      activities = Activity.pull_dual_activities(@uid1, @uid2)
      expect(activities.nil?).to eq(false)
      expect(activities.count).to eq(2)
    end
  end

  context 'confirm activity' do
    before :each do
      @activity = Activity.create_new_activity(@uid1, @uid2)
    end
    it 'one user accept' do
      activity = Activity.schedule_activity(@activity.aid, @uid1)
      expect(activity.nil?).to eq(false)
      expect(activity[:status]).to eq('PENDING')
      expect(activity[:fst_accept]).to eq(true)
      expect(activity[:snd_accept]).to eq(false)
    end
    it 'both matchmake accept' do
      activity = Activity.schedule_activity(@activity.aid, @uid1)
      activity = Activity.schedule_activity(@activity.aid, @uid2)
      expect(activity.nil?).to eq(false)
      expect(activity[:status]).to eq('SCHEDULED')
      expect(activity[:fst_accept]).to eq(true)
      expect(activity[:snd_accept]).to eq(true)
    end
  end

end
