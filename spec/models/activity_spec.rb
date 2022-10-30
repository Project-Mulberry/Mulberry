require 'rails_helper'

RSpec.describe Activity, type: :model do
  before :each do
    @uid1 = User.create_new_user('1234567890', '12345678')[:uid]
    @uid2 = User.create_new_user('1234567891', '12345678')[:uid]
    @cid = Coupon.create!({:name => 'coupon'}).cid
  end

  context 'create new activity' do
    it 'Successfully' do
      activity = Activity.create_new_activity(@cid, @uid1, @uid2)
      expect(activity.nil?).to eq(false)
      expect(activity.status).to eq('PENDING')
    end
  end

  context 'pull all activities by uid' do
    before :each do
      Activity.create_new_activity(@cid, @uid1, @uid2)
      Activity.create_new_activity(@cid, @uid2, @uid1)
    end
    it 'Successfully' do
      activities = Activity.pull_activities(@uid1)
      expect(activities.nil?).to eq(false)
      expect(activities.count).to eq(2)
    end
  end

  context 'pull all activities by two uids' do
    before :each do
      Activity.create_new_activity(@cid, @uid1, @uid2)
      Activity.create_new_activity(@cid, @uid2, @uid1)
    end
    it 'Successfully' do
      activities = Activity.pull_dual_activities(@uid1, @uid2)
      expect(activities.nil?).to eq(false)
      expect(activities.count).to eq(2)
    end
  end

  context 'confirm activity' do
    it 'one user accept' do
      activity = Activity.create_new_activity(@cid, @uid1, @uid2)
      activity = Activity.confirm_activity(activity.aid, @uid1)
      expect(activity.nil?).to eq(false)
      expect(activity[:status]).to eq('PENDING')
      expect(activity[:fst_accept]).to eq(true)
      expect(activity[:snd_accept]).to eq(false)
    end
    it 'both users accept' do
      activity = Activity.create_new_activity(@cid, @uid1, @uid2)
      activity = Activity.confirm_activity(activity.aid, @uid1)
      activity = Activity.confirm_activity(activity.aid, @uid2)
      expect(activity.nil?).to eq(false)
      expect(activity[:status]).to eq('SCHEDULED')
      expect(activity[:fst_accept]).to eq(true)
      expect(activity[:snd_accept]).to eq(true)
    end
  end

  context 'mark activity as done' do
    it 'Successfully' do
      activity = Activity.create_new_activity(@cid, @uid1, @uid2)
      activity = Activity.done_activity(activity.aid)
      expect(activity.nil?).to eq(false)
      expect(activity[:status]).to eq('DONE')
    end
  end
end
