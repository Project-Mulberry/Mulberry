class Prompt < ActiveRecord::Migration
  def change
    create_table(:prompts, primary_key: 'uid') do |i|
      i.string  :answer1
      i.string  :answer2
      i.string  :answer3
    end
  end
end
