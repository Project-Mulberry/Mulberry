require 'rails_helper'


RSpec.describe User, type: :model do
  context 'check profile created' do
    it 'created' do
      result = User.create.profile_created?
      expect(result).to eq(false)
    end
  end
end
