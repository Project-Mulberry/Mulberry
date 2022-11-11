class MatchHistory < ActiveRecord::Base
  # @param  int(uid)
  # @param  int(matched_uid)
  # @return MatchHistory
  def self.add_new_history(uid, matched_uid)
    history = {:uid => uid, :matched_uid => matched_uid, :connected => false, :updated_time => DateTime.now()}
    return MatchHistory.create!(history)
  end
end