require 'date'

class User < ActiveRecord::Base
  # all users must have phone and password
  validates :phone, :password, presence: true

  # require all these details to be present, but only after
  # the user was created with valid password and phone.
  # That's why we add if: -> { persisted? }
  validates :name, :gender, :sexuality, :birthday, :location, :education,
            :career, :height, :profile_photo,
            presence: true, if: -> { persisted? }
  # validates :phone, format: { with: /\d*/, message: "only allows digits" },
  #          if: -> { phone.present? }
  #validates :phone, length: { is: 10 }, if: -> { phone.present? }
  validates :phone, uniqueness: true


  validates :phone,:presence => true,
            :numericality => true,
            :length => { :minimum => 10, :maximum => 15 }

  has_one :interest, primary_key: :uid, foreign_key: :uid
  accepts_nested_attributes_for :interest

  # @param  string(phone)
  # @param  string(password)
  # @return false if password is wrong or phone is invalid or phone not exists
  # @return true if phone and password is matching
  def self.verify_phone_and_password(phone, password)
    unless phone =~ /^\d{10}$/
      return false
    end
    user = find_user_by_phone(phone)
    unless user.where(phone: phone).any?
      return false
    end
    return user.first[:password] == password
  end

  # @param  string(phone)
  # @return User
  def self.find_user_by_phone(phone)
    User.where(phone: phone)
  end
  # 1. this is returning an ActiveRecord::Relation object. Not a single User record
  # 2. Rails already has a method for this: User.find_by_phone("4345453434")

  # @param  string(phone)
  # @param  string(password)
  # @return nil if phone is invalid or phone already registered
  # @return User
  def self.create_new_user(phone, password)
    unless phone =~ /^\d{10}$/
      return nil
    end
    if User.where(phone: phone).any?
      return nil
    end
    user = User.create!({:phone => phone,
                  :password => password })
    Interest.create!({:uid => user[:uid],
                      :interest1 => '',
                      :interest2 => '',
                      :interest3 => ''})
    Prompt.create!({:uid => user[:uid],
                    :answer1 => '',
                    :answer2 => '',
                    :answer3 => ''})
    return user
  end

  # @param  User(already updated User object)
  # @return None
  def self.update_user_info(user)
    user.save!
  end
end

