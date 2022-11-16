Given("the following questions exist: Phone, Password") do
  page.should have_content "Phone"
  page.should have_content "Password"
end

Given("I fill in the following questions: Phone, Password") do
  fill_in("user[phone]", with: "2342342345")
  fill_in("user[password]", with: "test1234")
end

Then("I fill in the following questions: Name, Gender, Sexuality, Location, Career, Height, Profile Photo URL, Interest, Prompt") do
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

Then("I fill in the following questions: Interest, Prompt") do
  fill_in("user[interest_attributes][interest1]", with: "AAA")
  fill_in("user[interest_attributes][interest2]", with: "BBB")
  fill_in("user[interest_attributes][interest3]", with: "CCC")
  fill_in("user[prompt_attributes][answer1]", with: "AAA")
  fill_in("user[prompt_attributes][answer2]", with: "BBB")
  fill_in("user[prompt_attributes][answer3]", with: "CCC")
end

Then("I fill in the following questions: Gender, Sexuality, Location, Career, Height, Profile Photo URL") do
  fill_in("user[gender]", with: "male")
  fill_in("user[sexuality]", with: "straight")
  fill_in("user[birthday]", with: "2010-11-11")
  fill_in("user[location]", with: "Chicago")
  fill_in("user[career]", with: "driver")
  fill_in("user[height]", with: "7-7")
  fill_in("user[profile_photo]", with: "www.gogole.com")
end

Then("I should be redirected to the user edit page") do
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == "/users/#{User.last.id}/edit"
  else
    assert_equal "/users/#{User.last.id}/edit", current_path
  end
end

Then("I should be redirected to the matchmake page") do
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == matchmake_index_path
  else
    assert_equal matchmake_index_path, current_path
  end
end

Given("I fill in the question {string} with answer {string}") do |string, string2|
  puts "string: #{string}"
  puts "string2: #{string2}"
end

Then("I should see a warning {string}") do |string|
  puts "string: #{string}"
end

When /^I try to go to the URL "(.*)"$/ do |url|
  visit url
end

Then /I logged in using wrong password/ do
  fill_in("user[phone]", with: "1534643573")
  fill_in("user[password]", with: "2")
end