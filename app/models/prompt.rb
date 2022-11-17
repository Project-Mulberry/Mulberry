class Prompt < ActiveRecord::Base
  belongs_to :user, foreign_key: :uid
end