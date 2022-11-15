Feature: create a new user profile

	As a new or previous user
	So that I can see my matches and chats
	I either sign up or log in


Background: the profile creation form is shown

	Given  I am on the signup page
	And    the following questions exist: Phone, Password


Scenario: fill in correct answers and create successful, log out, log in succesfully
	Given  I fill in the following questions: Phone, Password
	When   I press "Sign Up"
	Then   I should be redirected to the user edit page
	And    I fill in the following questions: Name, Gender, Sexuality, Location, Career, Height, Profile Photo URL
	And    I press "Submit"
	Then   I should be on the home page
	When   I follow "Log Out"
	Then   I should be on the login page
	Then   I fill in the following questions: Phone, Password
	And    I press "Log In"
	Then   I should be on the home page


Scenario: click create button with incomplete answers for password
	Given  I fill in the question "Phone" with answer "1234567890"
	When   I press "Sign Up"
	Then   I should see a warning "can't be blank"


Scenario: click submit button with a invalid answer for Phone
	Given  I fill in the question "Phone" with answer "abcde"
	And    I press "Sign Up"
	Then   I should see a warning "is not a number"


Scenario: click submit button with a too short answer for Phone
	Given  I fill in the question "Phone" with answer "111"
	And    I press "Sign Up"
	Then   I should see a warning "is too short"
