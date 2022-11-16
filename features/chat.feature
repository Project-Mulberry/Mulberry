Feature: start a chat from the Message List

    As a user
    So that I can start on a particular conversation
    I want to go through all my chatlist and enter the chat with a another user


Background: chats in database

    Given the following profiles exist:
    | name    | location | education   | career              | phone	  | password	| gender	| birthday	    | sexuality	| height | profile_photo |
    | Marcus  | NY       | Bachelor    | Student             | 1534643573 | 1           | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
    | Zhen    | NY       | Master      | Student             | 5437525723 | 1           | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
    | Jack    | NY       | PhD         | Software Engineer   | 4668756566 | 1           | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
    | Hang    | NY       | High School | Unemployed          | 4527772777 | 1           | 1         | 01-Jan-2000	| 1		    | 1      | 1             |


    Given the following messages exist:
    | sender_uid | receiver_uid | key     | message                  |
    | 1          | 2            | <1>-<2> | Hello Zhen, How are you! |
    | 2          | 1            | <1>-<2> | Hi Marcus!               |
    | 1          | 3            | <1>-<3> | Hi, what\'s up           |
    | 4          | 1            | <1>-<4> | Morning!                 |

    Given the following interests exist:
    | interest1 | interest2 | interest3 |
    | Y         | Y      	| Y      	|
    | Y      	| Y      	| Y      	|
    | Y      	| Y      	| Y      	|
    | N      	| N      	| N      	|

    Given  I am on the login page
    Then   I logged in as a user
    And    I press "Log In"
    And    I am on the messages page


Scenario: click "login" to see all messages of the specific user with other users
    Then   I should see "Your Chats"
    But    I should not see the following names: Lucy, Lily, Tom


Scenario: click "show" to to see all messages with a particular user and go back to chat list
    When   I follow "Show"
    Then   I should see "Conversation with"
    When   I follow "Back to Message List"
    Then   I should be on the messages page


Scenario: click "show" to to see all messages with a particular user and go back to match page
    When   I follow "Show"
    Then   I should see "Conversation with"
    When   I follow "Back to Match List"
    Then   I should be on the matchmake page

