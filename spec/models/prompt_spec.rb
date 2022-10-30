require 'rails_helper'

RSpec.describe Prompt, type: :model do
  before :each do
    @user = User.create_new_user('1234567890', '12345678')
    @uid = @user[:uid]
  end

  context 'get prompts by uid' do
    it 'Successfully' do
      prompt = Prompt.get_prompt_by_uid(@uid)
      expect(prompt.nil?).to eq(false)
      expect(prompt.answer1.nil?).to eq(false)
      expect(prompt.answer1).to eq('')
    end
  end

  context 'update prompts' do
    it 'Successfully' do
      prompt = Prompt.get_prompt_by_uid(@uid)
      prompt.answer1 = 'some answers'
      Prompt.update_prompt(prompt)
      prompt = Prompt.get_prompt_by_uid(@uid)
      expect(prompt.nil?).to eq(false)
      expect(prompt.answer1.nil?).to eq(false)
      expect(prompt.answer1).to eq('some answers')
    end
  end

end
