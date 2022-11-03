<<<<<<< HEAD
Feature: create a new user profile

	As a new user
	So that I can create a profile to use Mulberry
	I want see my 10 daily matches after I complete creating my profile


Background: the profile creation form is shown

	Given  I am on the home page
	And    the following questions exist: Phone, Password


Scenario: fill in correct answers and create successful
	Given  I fill in the following questions: Phone, Password
	When   I follow "Create"
	Then   I should be on the user/edit page
	And    I fill in the following questions: Name, Gender, Sexuality, Location, Career, Height, Profile Photo URL
	And    I follow "Submit"
	Then   I should be on the matchmake page


Scenario: click create button with incomplete answers for password
	Given  I fill in the question "Phone" with answer "1234567890"
	When   I follow "Create"
	Then   I should see a warning "can't be blank"


Scenario: click submit button with a invalid answer for Phone
	Given  I fill in the question "Phone" with answer "abcde"
	And    I follow "Create"
	Then   I should see a warning "is not a number"

Scenario: click submit button with a too short answer for Phone
	Given  I fill in the question "Phone" with answer "111"
	And    I follow "Create"
	Then   I should see a warning "is too short"
=======
Feature: create a new user profile

	As a new user
	So that I can create a profile to use Mulberry
	I want see my 10 daily matches after I complete creating my profile


Scenario: the profile creation

	Given  I am on the home page
	And I fill in "user[phone]" with "2342342345"
	And I fill in "user[password]" with "test1234"
	When   I click "submit"
	Then   I should see the user edit page


#Scenario: fill in correct answers
#	Given  I fill in the following questions: Phone, Name, Age, Gender, Sexuality, Height, Location, Education, Career, Hobbies
#	When   I click "submit"
#	Then   I should see the match page
#
#
#Scenario: click submit button with incomplete answers
#	Given  I fill in the following questions: Phone, Name, Age, Gender, Sexuality, Height, Location
#	When   I click "submit"
#	Then   I should see a warning "You have incomplete answers for some questions!"
#	And    I should see the following questions highlighted: Location, Education, Career, Hobbies
#
#
#Scenario: click submit button with a invalid answer for Phone
#	Given  I fill in the question "Phone" with answer "abcde"
#	And    I fill in the following questions: Name, Age, Gender, Sexuality, Height, Location, Education, Career, Hobbies
#	When   I click "submit"
#	Then   I should see a warning "You have entered an invalid Phone Number"
#	And    I should see the following questions highlighted: Phone
>>>>>>> 8a2c09f84bb08fd23816bc011e2fc5f5d3c62b2a
