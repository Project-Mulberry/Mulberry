Feature: create a new user profile

	As a new or previous user
	So that I can see my matches and chats
	I either sign up or log in


Background: the signup page is shown

	Given the following profiles exist:
		| name    | location | education   | career              | phone	  | password	| gender	| birthday	    | sexuality	| height | profile_photo |
		| Marcus  | NY       | Bachelor    | Student             | 1534643573 | 1           | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
		| Zhen    | NY       | Master      | Student             | 5437525723 | 1           | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
		| Jack    | NY       | PhD         | Software Engineer   | 4668756566 | 1           | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
		| Hang    | NY       | High School | Unemployed          | 4527772777 | 1           | 1         | 01-Jan-2000	| 1		    | 1      | 1             |

	Given  I am on the signup page
	And    the following questions exist: Phone, Password


Scenario: fill in correct answers and create successful, log out, log in succesfully
	Given  I fill in the following questions: Phone, Password
	When   I press "Sign Up"
	Then   I should be redirected to the user edit page
	And    I fill in the following questions: Name, Gender, Sexuality, Location, Career, Height, Profile Photo URL, Interest, Prompt
	And    I press "Submit"
	Then   I should be on the home page
	When   I follow "Log Out"
	Then   I should be on the login page
	Then   I fill in the following questions: Phone, Password
	And    I press "Log In"
	Then   I should be on the home page


Scenario: click signup button with incomplete answers for password
	Given  I fill in the question "Phone" with answer "1234567890"
	When   I press "Sign Up"
	Then   I should see a warning "can't be blank"


Scenario: click signup button with a invalid answer for Phone
	Given  I fill in the question "Phone" with answer "abcde"
	And    I press "Sign Up"
	Then   I should see a warning "is not a number"


Scenario: click signup button with a too short answer for Phone
	Given  I fill in the question "Phone" with answer "111"
	And    I press "Sign Up"
	Then   I should see a warning "is too short"


Scenario: click submit button with incomplete answers for some questions
	Given  I fill in the following questions: Phone, Password
	When   I press "Sign Up"
	Then   I should be redirected to the user edit page
	And    I fill in the following questions: Gender, Sexuality, Location, Career, Height, Profile Photo URL
	And    I press "Submit"
	Then   I should be on the user profile page
	Then   I should see a warning "can't be blank"


Scenario: sign up and leave, log in and continue to finish filling profile
	Given  I fill in the following questions: Phone, Password
	When   I press "Sign Up"
	Then   I should be redirected to the user edit page
	When   I follow "Log Out"
	Then   I should be on the login page
	When   I fill in the following questions: Phone, Password
	And    I press "Log In"
	Then   I should be on the edit profile page

	
Scenario: sign up and log in with wrong number
	Given  I am on the login page
	Then   I logged in using wrong password
	And    I press "Log In"
	Then   I should be on the login page
	And    I should see a warning "Invalid email/password combination"


Scenario: try to navigate to other users' profile or login/signup again
	Given  I am on the login page
	Then   I logged in as a user
	And    I press "Log In"
	Then   I should be on the home page
	When   I try to go to the URL "/users/4/edit"
	Then   I should be on the home page
	When   I try to go to the URL "/login"
	Then   I should be on the home page


Scenario: try to access pages before login/signup
	Given  I am on the login page
	When   I try to go to the URL "/matchmake"
	Then   I should be on the login page
	And    I should see a warning "Please log in."

Scenario: edit profile successfully
	Given  I fill in the following questions: Phone, Password
	When   I press "Sign Up"
	Then   I should be redirected to the user edit page
	And    I fill in the following questions: Name, Gender, Sexuality, Location, Career, Height, Profile Photo URL, Interest, Prompt
	And    I press "Submit"
	When   I follow "Profile"
	Then   I should be on the user profile page
	When   I follow "Edit"
	Then   I should be on the edit profile page
	And    I fill in the following questions: Interest, Prompt
	And    I press "Submit"
	Then   I should be on the home page


