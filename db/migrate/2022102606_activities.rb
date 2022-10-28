class Activities < ActiveRecord::Migration
  def change
    create_table(:activities, primary_key: 'aid') do |a|
      a.string   :status
      a.integer  :coupon_id
      a.integer  :fst_user
      a.boolean  :fst_accept
      a.integer  :snd_user
      a.boolean  :snd_accept
    end
  end
end
