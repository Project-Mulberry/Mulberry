class Activities < ActiveRecord::Migration
  def change
    create_table(:activities, primary_key: 'aid') do |a|
      a.string   :status     # PENDING, SCHEDULED, DONE
      a.integer  :coupon_id
      a.datetime :datetime
      a.integer  :fst_uid
      a.boolean  :fst_accept
      a.integer  :snd_uid
      a.boolean  :snd_accept
    end
  end
end
