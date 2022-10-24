Feature: create a new user profile

	As a new user
	So that I can create a profile to use Mulberry
	I want see my 10 daily matches after I complete creating my profile

Background: the profile creation form is shown

	Given the following questions exist:

Scenario: fill in correct answers
	When I
	And  I
	And  I
	Then I

Scenario: fill in invalid email
	Given I
	When  I
	Then  I should
	And   I should
	But   I should

Scenario: fill in invalid phone number
	Given I
	Then  I should
	When  I
	Then  I should
	And   I should
