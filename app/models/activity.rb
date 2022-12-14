class Activity < ActiveRecord::Base
  # @param  int(first uid)
  # @param  int(second uid)
  # @return Activity
  def self.create_new_activity(fst_uid, snd_uid)
    cid = Coupon.coupon_recommend(fst_uid, snd_uid)
    activity = {
      :status => 'PENDING',
      :coupon_id => cid,
      :datetime => DateTime.now(),
      :fst_uid => fst_uid,
      :fst_accept => false,
      :snd_uid => snd_uid,
      :snd_accept => false }
    return Activity.create!(activity)
  end

  # @param  int(activity id)
  # @param  int(uid)
  # @return Activity
  def self.schedule_activity(aid, uid)
    activity = Activity.where(aid: aid).first
    if activity[:fst_uid].to_s == uid.to_s
      activity[:fst_accept] = true
    else
      activity[:snd_accept] = true
    end
    if activity[:fst_accept] && activity[:snd_accept]
      activity[:status] = 'SCHEDULED'
    end
    activity.save
    return activity
  end

  PULL_DUAL_USER_ACTIVITY_BASE_SQL_QUERY =
    "SELECT * FROM activities WHERE (fst_uid = ? AND snd_uid = ?) OR (fst_uid = ? AND snd_uid = ?) ORDER BY datetime ASC"

  # @param  int(current login uid)
  # @param  int(uid who is invited)
  # @return list(Activity)
  def self.pull_dual_activities(current_uid, interactive_uid)
    sql = Helper.generate_query(PULL_DUAL_USER_ACTIVITY_BASE_SQL_QUERY, [current_uid.to_s, interactive_uid.to_s, interactive_uid.to_s, current_uid.to_s])
    return ActiveRecord::Base.connection.execute(sql).to_a
  end

end
