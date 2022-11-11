class MatchHistories < ActiveRecord::Migration
  def change
    create_table(:match_histories, id: false) do |h|
      h.integer   :uid
      h.integer   :matched_uid
      h.boolean   :connected
      h.timestamp :updated_time
    end
  end
end
