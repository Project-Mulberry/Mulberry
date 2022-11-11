require 'rails_helper'

RSpec.describe MatchHistory, type: :model do
  before :each do
    @uid1 = User.create_new_user('1234567890', '12345678')[:uid]
    @uid2 = User.create_new_user('1234567891', '12345678')[:uid]
  end

  context 'add new match history' do
    it 'Successfully' do
      history = MatchHistory.add_new_history(@uid1, @uid2)
      expect(history[:uid]).to eq(@uid1)
      expect(history[:matched_uid]).to eq(@uid2)
      expect(history[:connected]).to eq(false)
    end
  end

end
