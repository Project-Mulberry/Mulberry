class Messages < ActiveRecord::Migration
  def change
    create_table(:messages, primary_key: 'mid') do |m|
      m.integer  :sender_uid
      m.integer  :receiver_uid
      m.string   :key          # <smaller_uid>-<larger_uid>
      m.datetime :timestamp
      m.string   :message
      m.boolean  :is_read
    end
  end
end