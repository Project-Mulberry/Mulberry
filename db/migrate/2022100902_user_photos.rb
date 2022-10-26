class UserPhotos < ActiveRecord::Migration
  def change
    create_table(:user_photos, id: false) do |u|
      u.integer :uid
      u.string  :link
      u.string  :type
    end
  end
end
