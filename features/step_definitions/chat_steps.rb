
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

Then /I logged in as another user/ do
  fill_in("user[phone]", with: "4527772778")
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

Then("I fill in a test message") do
  fill_in("message[message]", with: "This is a test message")
end

Then("I logged in as a Zhen") do
  fill_in("user[phone]", with: "5437525723")
  fill_in("user[password]", with: "1")
end
