class Activities < ActiveRecord::Migration
  def change
    create_table(:activities, primary_key: 'aid') do |a|
      a.string   :status
      a.datetime :start_time
      a.datetime :end_time
      a.integer  :coupon_id
      a.integer  :fst_user
      a.integer  :snd_user
    end
  end
end
