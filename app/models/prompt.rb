class Prompt < ActiveRecord::Base
  # @param  int(uid)
  # @return Prompt
  def self.pull_prompt_by_uid(uid)
    return Prompt.where(uid: uid)
  end

  # @param  Prompt(already updated Prompt)
  # @return None
  def self.update_prompt(prompt)
    prompt.save
  end
end