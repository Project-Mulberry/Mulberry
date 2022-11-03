class Prompt < ActiveRecord::Base
  # @param  int(uid)
  # @return Prompt
  def self.get_prompt_by_uid(uid)
    return Prompt.where(uid: uid).first
  end

  # @param  Prompt(already updated Prompt)
  # @return None
  def self.update_prompt(prompt)
    prompt.save
  end
end