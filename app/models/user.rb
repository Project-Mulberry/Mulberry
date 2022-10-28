require 'date'

class User < ActiveRecord::Base
  attr_accessor(:password)
  def self.verify_username_and_password(username, password)
    user = find_user_by_username(username)
    if user.nil? or user.first.nil?
      return false
    end
    return user.first[:password] == password
  end

  def self.find_user_by_username(username)
    return User.where(username: username)
  end

  def self.create_new_user(username, password)
    if User.where(username: 'Ryan').exists?
      return nil
    end
    User.create!({:username => username,
                  :password => password,
                  :created_time => DateTime.new })
    return find_user_by_username(username)
  end

  def self.update_user_info(user)
    user.save
  end

  def self.update_profile_photo(uid, photo_link)
    user = User.where(uid: uid)
    user.profile_photo = photo_link
    user.save
  end
end
