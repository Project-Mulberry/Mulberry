class Coupon < ActiveRecord::Base

  PULL_ALL_COUPONS_BASE_SQL_QUERY = "SELECT cid FROM coupons WHERE name = 'food'"
  def self.get_default_coupon_list
    ActiveRecord::Base.connection.execute(PULL_ALL_COUPONS_BASE_SQL_QUERY).to_a
  end

  FIND_MATCH_INTEREST_IN_COUPON_BASE_SQL_QUERY =
    "SELECT cid FROM coupons WHERE name IN ?"
  # @param uid1
  # @param uid2
  # @return cid, integer
  def self.coupon_recommend(uid1, uid2)
    user1_interests = Interest.get_interests_by_uid(uid1)
    user2_interests = Interest.get_interests_by_uid(uid2)
    user1_interests = [
      user1_interests.interest1,
      user1_interests.interest2,
      user1_interests.interest3
    ]
    user2_interests = [
      user2_interests.interest1,
      user2_interests.interest2,
      user2_interests.interest3
    ]

    # find overlap interest from both users
    interests = []
    user1_interests.each do |interest|
      if user2_interests.include?(interest)
        interests.append(interest)
      end
    end

    default_coupons = Coupon.get_default_coupon_list
    default_cid = default_coupons[rand(default_coupons.length)]["cid"]
    # return a random cid from the query result list or from a general 'food' list
    if interests.empty? then return default_cid end

    # search valid uid
    sql = Helper.generate_query(FIND_MATCH_INTEREST_IN_COUPON_BASE_SQL_QUERY,
                                [Helper.convert_array_to_sql_list(interests)])
    interests_list = ActiveRecord::Base.connection.execute(sql).to_a

    interests_list.empty? ? default_cid : interests_list[rand(interests_list.length)]["cid"]
  end
end
