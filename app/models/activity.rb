class Activity < ActiveRecord::Base
  def self.create_new_activity(coupon_id, fst_uid, snd_uid)
    activity = {
      :status => 'PENDING',
      :coupon_id => coupon_id,
      :fst_user => fst_uid,
      :fst_accept => false,
      :snd_user => snd_uid,
      :snd_accept => false }
    return Activity.create!(activity)
  end

  def self.confirm_activity(activity_id, user_id)
    activity = Activity.where(aid: activity_id)
    if activity.fst_user == user_id
      activity.fst_accept = true
    else
      activity.snd_accept = true
    end
  end

  PULL_SINGLE_USER_ACTIVITY_BASE_SQL_QUERY =
    "SELECT * FROM activities WHERE fst_user = '?' OR snd_user = '?' ORDER BY aid DESC"

  def self.pull_activities(user_id)
    sql = Helper.generate_query(PULL_SINGLE_USER_ACTIVITY_BASE_SQL_QUERY, [user_id])
    return ActiveRecord::Base.connection.execute(sql)
  end

  PULL_DUAL_USER_ACTIVITY_BASE_SQL_QUERY =
    "SELECT * FROM activities WHERE (fst_user = '?' AND snd_user = '?') OR (fst_user = '?' AND snd_user = '?') ORDER BY aid DESC"

  def self.pull_dual_activities(current_uid, interactive_uid)
    sql = Helper.generate_query(PULL_DUAL_USER_ACTIVITY_BASE_SQL_QUERY, [current_uid, interactive_uid, interactive_uid, current_uid])
    return ActiveRecord::Base.connection.execute(sql)
  end

  def self.done_activty(aid)
    activity = Activity.where(aid: aid)
    activity.status = 'DONE'
    activity.save
  end
end
