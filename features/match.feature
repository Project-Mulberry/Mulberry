Feature: view profile of 10 daily matches

	As a user
	So that I can chat with 1 of my 10 daily matches
	I want to click on each of the 10 profiles and view the details


Background: profiles in database
	Given the following profiles exist:
	| name    | age | location     | education           | career   | Hobbies   |
	| Aaron   | 25  | New York, NY | Columbia University | Finance  | NA        |
	| Barry   | 24  | New York, NY | Columbia University | Finance  | NA        |
	| Carl    | 30  | New York, NY | Columbia University | Finance  | NA        |
	| Deven   | 21  | New York, NY | Columbia University | Finance  | NA        |
	| Elloiot | 29  | New York, NY | Columbia University | Finance  | NA        |
	| Fred    | 27  | New York, NY | Columbia University | Finance  | NA        |
	| George  | 22  | New York, NY | Columbia University | Finance  | NA        |
	| Hector  | 25  | New York, NY | Columbia University | Finance  | NA        |
	| Isaac   | 23  | New York, NY | Columbia University | Finance  | NA        |
	| Jason   | 22  | New York, NY | Columbia University | Finance  | NA        |


Scenario: fill in correct answers
	Given  I
	When   I
	Then   I


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

