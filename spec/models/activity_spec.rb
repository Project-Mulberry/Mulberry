require 'rails_helper'



RSpec.describe Activity, type: :model do
  def create_new_activity(cid, fst_uid, snd_uid)
    activity = {
      :status => 'PENDING',
      :coupon_id => cid,
      :datetime => DateTime.now(),
      :fst_uid => fst_uid,
      :fst_accept => false,
      :snd_uid => snd_uid,
      :snd_accept => false }
    return Activity.create!(activity)
  end

  before :each do
    @uid1 = User.create!({:phone => '1234567890', :password => '12345678'})[:uid]
    @uid2 = User.create!({:phone => '1234567891', :password => '12345678'})[:uid]
    @cid = Coupon.create!({:name => 'coupon'}).cid
  end

  context 'create new activity' do
    it 'Successfully' do
      activity = create_new_activity(@cid, @uid1, @uid2)
      expect(activity.nil?).to eq(false)
      expect(activity.status).to eq('PENDING')
    end
  end

  context 'pull all activities by two uids' do
    before :each do
      create_new_activity(@cid, @uid1, @uid2)
      create_new_activity(@cid, @uid2, @uid1)
    end
    it 'Successfully' do
      activities = Activity.pull_dual_activities(@uid1, @uid2)
      expect(activities.nil?).to eq(false)
      expect(activities.count).to eq(2)
    end
  end

  context 'confirm activity' do
    it 'one user accept' do
      activity = create_new_activity(@cid, @uid1, @uid2)
      activity = Activity.schedule_activity(activity.aid, @uid1)
      expect(activity.nil?).to eq(false)
      expect(activity[:status]).to eq('PENDING')
      expect(activity[:fst_accept]).to eq(true)
      expect(activity[:snd_accept]).to eq(false)
    end
    it 'both matchmake accept' do
      activity = create_new_activity(@cid, @uid1, @uid2)
      activity = Activity.schedule_activity(activity.aid, @uid1)
      activity = Activity.schedule_activity(activity.aid, @uid2)
      expect(activity.nil?).to eq(false)
      expect(activity[:status]).to eq('SCHEDULED')
      expect(activity[:fst_accept]).to eq(true)
      expect(activity[:snd_accept]).to eq(true)
    end
  end

end
