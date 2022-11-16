class Activity < ActiveRecord::Base
  # @param  int(coupon_id)
  # @param  int(first uid)
  # @param  int(second uid)
  # @return list(Activity)

  def self.create_new_activity(cid, fst_uid, snd_uid)
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
    if activity[:fst_uid] == uid
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

  PULL_SINGLE_USER_ACTIVITY_BASE_SQL_QUERY =
    "SELECT * FROM activities WHERE fst_uid = ? OR snd_uid = ? ORDER BY aid DESC"

  # @param  int(uid)
  # @return list(Activity)
  def self.pull_activities(uid)
    sql = Helper.generate_query(PULL_SINGLE_USER_ACTIVITY_BASE_SQL_QUERY, [uid.to_s, uid.to_s])
    return ActiveRecord::Base.connection.execute(sql)
  end

  PULL_DUAL_USER_ACTIVITY_BASE_SQL_QUERY =
    "SELECT * FROM activities WHERE (fst_uid = ? AND snd_uid = ?) OR (fst_uid = ? AND snd_uid = ?) ORDER BY datetime ASC"

  # @param  int(current login uid)
  # @param  int(uid who is invited)
  # @return list(Activity)
  def self.pull_dual_activities(current_uid, interactive_uid)
    sql = Helper.generate_query(PULL_DUAL_USER_ACTIVITY_BASE_SQL_QUERY, [current_uid.to_s, interactive_uid.to_s, interactive_uid.to_s, current_uid.to_s])
    return ActiveRecord::Base.connection.execute(sql)
  end

  # @param  int(activity id)
  # @return None
  def self.done_activity(aid)
    activity = Activity.where(aid: aid).first
    activity[:status] = 'DONE'
    activity.save
    return activity
  end
end
