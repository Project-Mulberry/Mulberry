class Users < ActiveRecord::Migration
  def change
    create_table(:users, primary_key: 'uid') do |u|
      u.string   :phone    # exactly 10 [0-9] numbers
      u.string   :password # at least 6 chars
      u.string   :name
      u.string   :gender
      u.string   :sexuality
      u.datetime :birthday
      u.string   :location
      u.string   :education
      u.string   :career
      u.string   :height   # feet
      u.string   :profile_photo
      u.timestamps
      #u.datetime :created_at
    end
  end
end
