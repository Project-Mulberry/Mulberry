class UserPhoto < ActiveRecord::Base
  # @param  int(uid)
  # @return list(UserPhoto)
  def self.get_all_photos_by_uid(uid)
    photos = UserPhoto.where(uid: uid)
    return photos.all
  end

  # @param  int(uid)
  # @param  string(photo_link)
  # @return UserPhoto
  def self.add_new_photo(uid, photo_link)
    photo = {:uid => uid, :link => photo_link}
    return UserPhoto.create!(photo)
  end

  DELETE_PHOTO_BASE_SQL_QUERY = 'DELETE FROM user_photos WHERE uid = ? AND link = \'?\''

  # @param  int(uid)
  # @param  string(photo_link)
  # @return None
  def self.remove_photo(uid, photo_link)
    sql = Helper.generate_query(DELETE_PHOTO_BASE_SQL_QUERY, [uid.to_s, photo_link])
    ActiveRecord::Base.connection.execute(sql)
  end
end
