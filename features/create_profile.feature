Feature: create a new user profile
	As a new user
	So that I can create a profile to use Mulberry
	I want see my 10 daily matches after I complete creating my profile


Background: the profile creation form is shown
	Given  I am on the home page
	And    the following questions exist: phone, password


Scenario: fill in correct answers
	Given  I fill in the following questions: Phone, Name, Age, Gender, Sexuality, Height, Location, Education, Career, Hobbies
	When   I click "submit"
	Then   I should see the match page


Scenario: click submit button with incomplete answers
	Given  I fill in the following questions: Phone, Name, Age, Gender, Sexuality, Height, Location
	When   I click "submit"
	Then   I should see a warning "You have incomplete answers for some questions!"
	And    I should see the following questions highlighted: Location, Education, Career, Hobbies


Scenario: click submit button with a invalid answer for Phone
	Given  I fill in the question "Phone" with answer "abcde"
	And    I fill in the following questions: Name, Age, Gender, Sexuality, Height, Location, Education, Career, Hobbies
	When   I click "submit"
	Then   I should see a warning "You have entered an invalid Phone Number"
	And    I should see the following questions highlighted: Phone
