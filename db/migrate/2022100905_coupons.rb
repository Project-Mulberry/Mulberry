class Coupons < ActiveRecord::Migration
  def change
    create_table(:coupons, primary_key: 'cid') do |c|
      c.string :content
      c.string :name
      c.string :location
      c.string :original_price
      c.string :discount_price
    end
  end
end
