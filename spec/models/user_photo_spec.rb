require 'rails_helper'

RSpec.describe UserPhoto, type: :model do
  before :each do
    @user = User.create!({:phone => '1234567890', :password => '12345678'})
    @uid = @user[:uid]
  end

  context 'add new photo to a user\'s photo album' do
    it 'Successfully' do
      user_photo = UserPhoto.add_new_photo(@uid, 'A Link to Photo')
      expect(user_photo[:uid]).to eq(@uid)
    end
  end

  context 'obtain all photos of a user' do
    it 'find all photos - has photos' do
      UserPhoto.add_new_photo(@uid, 'A Link to Photo')
      photos = UserPhoto.get_all_photos_by_uid(@uid)
      expect(photos.any?).to eq(true)
      expect(photos.count).to eq(1)
      expect(photos.first[:link]).to eq('A Link to Photo')
    end
    it 'find all photos - has no photo' do
      photos = UserPhoto.get_all_photos_by_uid(@uid)
      expect(photos.any?).to eq(false)
      expect(photos.count).to eq(0)
    end
  end

  context 'remove a photo from user\'s album' do
    it 'removes a photo with specific photo link' do
      user_photo = UserPhoto.add_new_photo(@uid, 'A Link to Photo')
      UserPhoto.remove_photo(@uid, user_photo[:link])
      photos = UserPhoto.get_all_photos_by_uid(@uid)
      expect(photos.any?).to eq(false)
      expect(photos.count).to eq(0)
    end
  end
end
