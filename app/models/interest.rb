class Interest < ActiveRecord::Base
  belongs_to :user, foreign_key: :uid

  # @param  int(uid)
  # @return list(Interest)
  def self.get_interests_by_uid(uid)
    return Interest.where(uid: uid).first
  end
end
