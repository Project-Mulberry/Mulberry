
#I should see "Chats for Marcus"
#Then /I should see "Chats for Marcus"/ do
  # Make sure that all the movies in the app are visible in the table
#result = true
#Message.all.each do |movie|
#if !page.body.include?(movie.title) then
#result = false
#end
#end
#result.should be true
  #pending "Fill in this step in movie_steps.rb"
#end

Given /the following messages exist/ do |message_table|
  message_table.hashes.each do |message|
    Message.create(message)
  end
end

Then /I logged in as a user/ do
  fill_in("user[phone]", with: "1534643573")
  fill_in("user[password]", with: "1")
end

Then /I should see all chats for "Marcus"/ do
  # Make sure that all the chats for Marcus are visible in the table
  result = true
  send = Message.where(sender_uid: $1).all
  receive = Message.where(receiver_uid: $1).all
  send.each do |m|
    if !page.body.include?(m.message) then
      result = false
    end
  end
  receive.each do |mr|
    if !page.body.include?(mr.message) then
      result = false
    end
  end
  result.should be true
  #pending "Fill in this step in movie_steps.rb"
end

Then("I fill in the chat box") do
  fill_in("user[name]", with: "Jack")
  fill_in("user[gender]", with: "male")
  fill_in("user[sexuality]", with: "straight")
  fill_in("user[birthday]", with: "2010-11-11")
  fill_in("user[location]", with: "Chicago")
  fill_in("user[career]", with: "driver")
  fill_in("user[height]", with: "7-7")
  fill_in("user[profile_photo]", with: "www.gogole.com")
  fill_in("user[interest_attributes][interest1]", with: "A")
  fill_in("user[interest_attributes][interest2]", with: "B")
  fill_in("user[interest_attributes][interest3]", with: "C")
  fill_in("user[prompt_attributes][answer1]", with: "A")
  fill_in("user[prompt_attributes][answer2]", with: "B")
  fill_in("user[prompt_attributes][answer3]", with: "C")
end