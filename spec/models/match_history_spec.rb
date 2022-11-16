require 'rails_helper'

RSpec.describe MatchHistory, type: :model do
  before :each do
    @uid1 = User.create!({
                           :phone => '1234567890',
                           :password => '12345678',
                           :name => 'User - 1 - male',
                           :gender => 'm',
                           :sexuality => 'straight',
                           :location => 'NY',
                           :birthday => '2000-01-01',
                           :education => 'bachelor',
                           :career => 'student',
                           :height => '6.0',
                           :profile_photo => '.',
                         })[:uid]
    @uid2 = User.create!({
                           :phone => '1234567891',
                           :password => '12345678',
                           :name => 'User - 2 - female',
                           :gender => 'f',
                           :sexuality => 'straight',
                           :location => 'NY',
                           :birthday => '2000-01-01',
                           :education => 'bachelor',
                           :career => 'student',
                           :height => '5.5',
                           :profile_photo => '.',
                         })[:uid]
    @uid3 = User.create!({
                           :phone => '1234567892',
                           :password => '12345678',
                           :name => 'User - 3 - male',
                           :gender => 'm',
                           :sexuality => 'homosexual',
                           :location => 'CA',
                           :birthday => '2000-01-01',
                           :education => 'bachelor',
                           :career => 'student',
                           :height => '6.0',
                           :profile_photo => '.',
                         })[:uid]
    Interest.create!({:uid => @uid1, :interest1 => 'Y', :interest2 => 'Y', :interest3 => 'Y'})
    Interest.create!({:uid => @uid2, :interest1 => 'Y', :interest2 => 'Y', :interest3 => 'Y'})
    Interest.create!({:uid => @uid3, :interest1 => 'Y', :interest2 => 'Y', :interest3 => 'Y'})
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

    end
  end

end
