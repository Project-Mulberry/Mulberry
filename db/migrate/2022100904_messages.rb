class Messages < ActiveRecord::Migration
  def change
    create_table(:messages, primary_key: 'mid') do |m|
      m.integer  :sender_id
      m.integer  :receiver_id
      m.datetime :timestamp
      m.string   :message
      m.boolean  :is_read
    end
  end
end