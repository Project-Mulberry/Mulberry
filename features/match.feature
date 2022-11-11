Feature: view profile of 10 daily matches

	As a user
	So that I can chat with 1 of my 10 daily matches
	I want to click on each of the 10 profiles and view the details


Background: profiles in database

	Given the following profiles exist:
	| name    | location | education   | career              | phone	| password	| gender	| birthday	| sexuality	| height | profile_photo |
	| Marcus  | NY       | Bachelor    | Student             | 1534643573 | 1       | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
	| Zhen    | NY       | Master      | Student             | 5437525723 | 1       | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
	| Jack    | NY       | PhD         | Software Engineer   | 4668756566 | 1       | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
	| Hang    | NY       | High School | Unemployed          | 4527772777 | 1       | 1         | 01-Jan-2000	| 1		    | 1      | 1             |

	Given the following interests exist:
	| interest1 | interest2 | interest3 |
	| Y         | Y      	| Y      	|
	| Y      	| Y      	| Y      	|
	| Y      	| Y      	| Y      	|
	| N      	| N      	| N      	|

	Given the following prompts exist:
		| answer1         | answer2         | answer3         |
		| prompt-1-answer | prompt-1-answer | prompt-1-answer |
		| prompt-1-answer | prompt-1-answer | prompt-1-answer |
		| prompt-1-answer | prompt-1-answer | prompt-1-answer |
		| prompt-1-answer | prompt-1-answer | prompt-1-answer |

	And I am on the matchmake page


Scenario: click "Direct to Message List" to check all chats
	When   I follow "Direct to Message List"
	Then   I should be on the messages page
	And    I should see the following names: Marcus, Zhen, Jack, Hang
	But    I should not see the following names: Lucy, Lily, Tom


Scenario: click "detail" to see more details of a particular user and chat with them
	When   I follow "Show"
	Then   I should see "Chats for Marcus"
	And    I should see the following questions: Name, Sexuality, Gender, Birthday, Height, Interest
	But    I should not see the following questions: Father's Name, Mother's Name, Credit Card Number
	When   I follow "Chat"
	And    I should see "Chats for Marcus"


Scenario: click "detail" to see more details of a particular user and go back
	When   I follow "detail"
	Then   I should see "Details about Marcus"
	When   I follow "Back"
	Then   I should be on the matchmake page