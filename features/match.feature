Feature: view profile of 10 daily matches

	As a user
	So that I can chat with 1 of my 10 daily matches
	I want to click on each of the 10 profiles and view the details


Background: profiles in database

	Given the following profiles exist:
	| Name    | Location | Education   | Career              | Hobby1 | Hobby2 | Hobby3 |
	| Marcus  | NY       | Bachelor    | Student             | Y      | Y      | Y      |
	| Zhen    | NY       | Master      | Student             | Y      | Y      | Y      |
	| Jack    | NY       | PhD         | Software Engineer   | Y      | Y      | Y      |
	| Hang    | NY       | High School | Unemployed          | N      | N      | N      |

	And I am on the matchmake page


Scenario: click "Direct to Message List" to check all chats
	When   I follow "Direct to Message List"
	Then   I should be on the messages page
	And    I should see the following names: Marcus, Zhen, Jack, Hang
	But    I should not see the following names: A, B, C


Scenario: click "detail" to see more details of a particular user and chat with them
	When   I follow "detail"
	Then   I should see "Details about Marcus"
	And    I should see the following questions: Name, Sexuality, Gender, Birthday, Height, Interest
	But    I should not see the following questions: A, B, C
	When   I follow "Chat"
	And    I should see "Chats for Marcus"


Scenario: click "detail" to see more details of a particular user and go back
	When   I follow "detail"
	Then   I should see "Details about Marcus"
	When   I follow "Back"
	Then   I should be on the matchmake page