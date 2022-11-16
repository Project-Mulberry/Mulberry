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
  has_one :prompt, primary_key: :uid, foreign_key: :uid

  accepts_nested_attributes_for :interest
  accepts_nested_attributes_for :prompt



  def profile_created?
    name.present? && gender.present? && sexuality.present?
  end
end
