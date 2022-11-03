Feature: start a chat from the Message List

    As a user
    So that I can start on a particular conversation
    I want to go through all my chatlist and enter the chat with a another user


Background: chats in database

    Given the following profiles exist:
    | name    | location | education   | career              | phone	| password	| gender	| birthday	| sexuality	| height | profile_photo |
    | Marcus  | NY       | Bachelor    | Student             | 1534643573 | 1       | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
    | Zhen    | NY       | Master      | Student             | 5437525723 | 1       | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
    | Jack    | NY       | PhD         | Software Engineer   | 4668756566 | 1       | 1         | 01-Jan-2000	| 1		    | 1      | 1             |
    | Hang    | NY       | High School | Unemployed          | 4527772777 | 1       | 1         | 01-Jan-2000	| 1		    | 1      | 1             |


    Given the following messages exist:
    | sender_uid | receiver_uid | message                  |
    | 1          | 2            | Hello Zhen, How are you! |
    | 2          | 1            | Hi Marcus!               |
    | 1          | 3            | Hi, what\'s up           |
    | 4          | 1            | Morning!                 |

    Given the following interests exist:
    | interest1 | interest2 | interest3 |
    | Y         | Y      	| Y      	|
    | Y      	| Y      	| Y      	|
    | Y      	| Y      	| Y      	|
    | N      	| N      	| N      	|


    And     I am on the messages page
    And     I should see the following names: Marcus, Zhen, Jack, Hang


Scenario: click "show" to to see all messages with a particular user and chat with them
    When   I follow "Show"
    Then   I should see "Chats for Marcus"
    And    I should see all chats for "Marcus"
    And    I should see the following names: Zhen, Jack, Hang
    But    I should not see the following names: Lily, Tom, June


Scenario: click "show" to to see all messages with a particular user and go back to chat list
    When   I follow "Show"
    Then   I should see "Chats for Marcus"
    When   I follow "Back to Message List"
    Then   I should be on the messages page


Scenario: click "show" to to see all messages with a particular user and go back to match page
    When   I follow "Show"
    Then   I should see "Chats for Marcus"
    When   I follow "Back to Match List"
    Then   I should be on the matchmake page

