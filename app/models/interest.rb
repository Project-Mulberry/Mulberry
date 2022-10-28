class Interest < ActiveRecord::Base
  def self.get_interests_by_uid(uid)
    return Interest.where(uid: uid)
  end

  def self.update_interest(interest)
    interest.save
  end
end
