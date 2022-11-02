
#I should see "Chats for Marcus"
Then /I should see "Chats for Marcus"/ do
  # Make sure that all the movies in the app are visible in the table
  result = true
  Message.all.each do |movie|
    if !page.body.include?(movie.title) then
      result = false
    end
  end
  result.should be true
  #pending "Fill in this step in movie_steps.rb"
end