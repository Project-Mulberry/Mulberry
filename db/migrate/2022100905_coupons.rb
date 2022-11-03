class Coupons < ActiveRecord::Migration
  def change
    create_table(:coupons, primary_key: 'cid') do |c|
      c.string :name
      c.string :message
      c.string :location
      c.string :original_price
      c.string :discount_price
      c.string :advertiser
    end
  end
end
