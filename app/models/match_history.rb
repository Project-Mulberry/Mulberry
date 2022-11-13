class MatchHistory < ActiveRecord::Base
  # @param  int(uid)
  # @param  int(matched_uid)
  # @return MatchHistory
  def self.add_new_history(uid, matched_uid)
    history = {:uid => uid, :matched_uid => matched_uid, :connected => false, :updated_time => DateTime.now()}
    return MatchHistory.create!(history)
  end

  # @param  int(uid)
  # @param  int(matched_uid)
  # @return MatchHistory
  def self.get_history_matched_uid_list(uid)
    history_list = MatchHistory.select(:matched_uid).where("uid = ? AND updated_time >= ?", uid, Date.today.midnight).to_a
    history_uid_list = []
    history_list.each do |h|
      history_uid_list.push(h.matched_uid)
    end
    return history_uid_list
  end

  MATCH_RECOMMENDATION_BASE_SQL = "SELECT u.*
FROM users u LEFT JOIN interests i ON u.uid = i.uid
WHERE u.gender = '?' AND u.location = '?' AND u.sexuality = '?' AND
      (i.interest1 IN ? OR i.interest2 IN ? OR i.interest3 IN ?) AND
      u.uid NOT IN ?"
  MATCH_RECOMMENDATION_NO_INTEREST_BASE_SQL = "SELECT u.*
FROM users u LEFT JOIN interests i ON u.uid = i.uid
WHERE u.gender = '?' AND u.location = '?' AND u.sexuality = '?' AND u.uid NOT IN ?"
  # @param uid, current user id
  # @return List(User), the matched users
  def self.get_match_recommendation(uid)
    user = User.find(uid)
    gender = if user.sexuality == 'straight'
               user.gender == 'm' ? 'f' : 'm'
             else
               user.gender
             end

    interest = Interest.find_by_uid(uid)
    interests = Helper.convert_array_to_sql_list([interest.interest1, interest.interest2, interest.interest3])

    matched_uid_list = Helper.convert_array_to_sql_list(get_history_matched_uid_list(uid).push(uid))

    match_sql = Helper.generate_query(MATCH_RECOMMENDATION_BASE_SQL,
                                      [gender, user.location, user.sexuality, interests, interests, interests, matched_uid_list])
    match_list = ActiveRecord::Base.connection.execute(match_sql)

    # if not find qualified match with interests, then return all qualified users without considering interests
    if match_list.nil? or match_list.length == 0
      match_sql = Helper.generate_query(MATCH_RECOMMENDATION_NO_INTEREST_BASE_SQL,
                                        [gender, user.location, user.sexuality, matched_uid_list])
      match_list = ActiveRecord::Base.connection.execute(match_sql)
    end

    # log the current matches in match_history database
    if match_list.nil? == false
      match_list.each do |match|
        add_new_history(uid, match['uid'])
      end
    end

    return match_list
  end
end