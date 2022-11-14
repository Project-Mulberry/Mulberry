require 'rails_helper'

RSpec.describe MatchHistory, type: :model do
  before :each do
    @uid1 = User.create_new_user('1234567890', '12345678')[:uid]
    @uid2 = User.create_new_user('1234567891', '12345678')[:uid]
    @uid3 = User.create_new_user('1234567892', '12345678')[:uid]

    # initialize user profile
    user1 = User.find(@uid1)
    user1.name = 'User - 1 - male'
    user1.gender = 'm'
    user1.sexuality = 'straight'
    user1.location = 'NY'
    user1.birthday = '2000-01-01'
    user1.education = 'bachelor'
    user1.career = 'student'
    user1.height = '6.0'
    user1.profile_photo = '.'
    user1.save!
    user2 = User.find(@uid2)
    user2.name = 'User - 2 - female'
    user2.gender = 'f'
    user2.sexuality = 'straight'
    user2.location = 'NY'
    user2.birthday = '2000-01-01'
    user2.education = 'bachelor'
    user2.career = 'student'
    user2.height = '5.5'
    user2.profile_photo = '.'
    user2.save!
    user3 = User.find(@uid3)
    user3.name = 'User - 3 - male'
    user3.gender = 'm'
    user3.sexuality = 'homosexual'
    user3.location = 'CA'
    user3.birthday = '2000-01-01'
    user3.education = 'bachelor'
    user3.career = 'student'
    user3.height = '6.0'
    user3.profile_photo = '.'
    user3.save!
    interest1 = Interest.get_interests_by_uid(@uid1)
    interest1.interest1 = 'Y'
    interest1.interest2 = 'Y'
    interest1.interest3 = 'Y'
    Interest.update_interest(interest1)
    interest2 = Interest.get_interests_by_uid(@uid2)
    interest2.interest1 = 'Y'
    interest2.interest2 = 'Y'
    interest2.interest3 = 'Y'
    Interest.update_interest(interest2)
    interest3 = Interest.get_interests_by_uid(@uid3)
    interest3.interest1 = 'Y'
    interest3.interest2 = 'Y'
    interest3.interest3 = 'Y'
    Interest.update_interest(interest3)
  end

  context 'add new match history' do
    it 'Successfully' do
      history = MatchHistory.add_new_history(@uid1, @uid2)
      expect(history[:uid]).to eq(@uid1)
      expect(history[:matched_uid]).to eq(@uid2)
      expect(history[:connected]).to eq(false)
    end
  end

  context 'get match recommendation' do
    it 'Successfully' do
      recommendation = MatchHistory.get_match_recommendation(@uid1)
      expect(recommendation.length).to eq(1)
      expect(recommendation.first["uid"]).to eq(@uid2)

      matched_id = MatchHistory.get_history_matched_uid_list(@uid1)
      expect(matched_id.first).to eq(@uid2)
    end

    it 'Successfully' do
      recommendation = MatchHistory.get_match_recommendation(@uid3)
      expect(recommendation.length).to eq(0)

      matched_id = MatchHistory.get_history_matched_uid_list(@uid3)
      expect(matched_id.length).to eq(0)

      expect(Helper.convert_array_to_sql_list(nil)).to eq('()')
    end
  end

end
