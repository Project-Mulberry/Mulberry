class UserPhoto < ActiveRecord::Base
  def self.get_all_photos_by_uid(uid)
    photos = UserPhoto.where(uid: uid)
    if photos.nil?
      return []
    end
    return photos
  end

  def self.add_new_photo(uid, photo_link)
    photo = {:uid => uid, :link => photo_link, :type => ''}
    UserPhoto.create!(photo)
  end

  def self.remove_photo(uid, photo_link)
    UserPhoto.destroy_by(uid: uid, link: photo_link)
  end
end
