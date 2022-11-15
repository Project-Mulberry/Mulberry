Feature: create a new user profile

	As a new user
	So that I can create a profile to use Mulberry
	I want see my 10 daily matches after I complete creating my profile


Background: the profile creation form is shown

	Given  I am on the signup page
	And    the following questions exist: Phone, Password


Scenario: fill in correct answers and create successful
	Given  I fill in the following questions: Phone, Password
	When   I press "Sign Up"
	Then   I should be redirected to the user edit page
	And    I fill in the following questions: Name, Gender, Sexuality, Location, Career, Height, Profile Photo URL
	And    I press "Submit"
	Then   I should be on the user profile page


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
