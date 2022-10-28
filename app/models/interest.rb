class Interest < ActiveRecord::Base
  # @param  int(uid)
  # @return list(Interest)
  def self.get_interests_by_uid(uid)
    return Interest.where(uid: uid).first
  end

  # @param  Interest(already updated Interest object)
  # @return None
  def self.update_interest(interest)
    interest.save
  end
end
