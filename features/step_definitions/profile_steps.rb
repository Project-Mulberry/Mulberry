Given("the following questions exist: Phone, Password") do
  page.should have_content "Phone"
  page.should have_content "Password"
end

Given("I fill in the following questions: Phone, Password") do
  fill_in("user[phone]", with: "2342342345")
  fill_in("user[password]", with: "test1234")
end

Then("I should be redirected to the user edit page") do
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == "/users/#{User.last.id}/edit"
  else
    assert_equal "/users/#{User.last.id}/edit", current_path
  end
end

# Then("I fill in the following questions: Name, Gender, Sexuality, Location, Career, Height, Profile Photo URL") do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# Given("I fill in the question {string} with answer {string}") do |string, string2|
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# Then("I should see a warning {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end