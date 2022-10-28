class Prompt < ActiveRecord::Migration
  def change
    create_table(:prompts, id: false) do |i|
      i.integer :uid
      i.string  :answer1
      i.string  :answer2
      i.string  :answer3
    end
  end
end
