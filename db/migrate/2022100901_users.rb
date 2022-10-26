class Users < ActiveRecord::Migration
  def change
    create_table(:users, primary_key: 'uid') do |u|
      u.string   :username
      u.string   :password
      u.string   :name
      u.string   :gender
      u.datetime :birthday
      u.string   :email
      u.datetime :created_time
      u.string   :city
      u.string   :profile_photo
    end
  end
end