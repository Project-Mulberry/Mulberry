require 'date'

class User < ActiveRecord::Base
  # @param  string(phone)
  # @param  string(password)
  # @return false if password is wrong or phone is invalid or phone not exists
  # @return true if phone and password is matching
  def self.verify_phone_and_password(phone, password)
    unless phone =~ /^\d{10}$/
      return false
    end
    if user.where(phone: phone).exist?
      return false
    end
    return find_user_by_phone(phone).first[:password] == password
  end

  # @param  string(phone)
  # @return User
  def self.find_user_by_phone(phone)
    return User.where(phone: phone)
  end

  # @param  string(phone)
  # @param  string(password)
  # @return nil if phone is invalid or phone already registered
  # @return User
  def self.create_new_user(phone, password)
    unless phone =~ /^\d{10}$/
      return nil
    end
    if User.where(phone: phone).exists?
      return nil
    end
    user = User.create!({:phone => phone,
                  :password => password,
                  :created_time => DateTime.new })
    Interest.create!({:uid => user[:uid]})
    Prompt.create!({:uid => user[:uid]})
    return user
  end

  # @param  User(already updated User object)
  # @return None
  def self.update_user_info(user)
    user.save
  end
end
