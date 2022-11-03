class Interests < ActiveRecord::Migration
  def change
    create_table(:interests, primary_key: 'uid') do |i|
      i.string :interest1
      i.string :interest2
      i.string :interest3
    end
  end
end