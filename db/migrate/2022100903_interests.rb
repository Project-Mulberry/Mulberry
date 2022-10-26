class Interests < ActiveRecord::Migration
  def change
    create_table(:interests, id: false) do |i|
      i.integer :uid
      i.string :interest1
      i.string :interest2
      i.string :interest3
    end
  end
end