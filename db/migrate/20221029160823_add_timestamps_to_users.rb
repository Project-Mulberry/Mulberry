class AddTimestampsToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.timestamps
    end
    remove_column :users, :created_time
  end

  def down
    add_column :users, :created_time, :datetime
    remove_column :users, :created_at
    remove_column :users, :updated_at
  end
end
