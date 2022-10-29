class UserPhoto < ActiveRecord::Base
  # @param  int(uid)
  # @return list(UserPhoto)
  def self.get_all_photos_by_uid(uid)
    photos = UserPhoto.where(uid: uid)
    if photos.nil?
      return []
    end
    return photos
  end

  # @param  int(uid)
  # @param  string(photo_link)
  # @return None
  def self.add_new_photo(uid, photo_link)
    photo = {:uid => uid, :link => photo_link}
    UserPhoto.create!(photo)
  end

  # @param  int(uid)
  # @param  string(photo_link)
  # @return None
  def self.remove_photo(uid, photo_link)
    UserPhoto.destroy_by(uid: uid, link: photo_link)
  end
end
