Given("the following questions exist: Phone, Password") do
  page.should have_content "Phone"
  page.should have_content "Password"
end

Given("I fill in the following questions: Phone, Password") do
  fill_in("user[phone]", with: "2342342345")
  fill_in("user[password]", with: "test1234")
end

Then("I fill in the following questions: Name, Gender, Sexuality, Location, Career, Height, Profile Photo URL") do
  fill_in("user[name]", with: "Jack")
  fill_in("user[gender]", with: "male")
  fill_in("user[sexuality]", with: "hetero")
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