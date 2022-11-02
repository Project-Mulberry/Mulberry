Feature: start a chat from the Message List

    As a user
    So that I can start on a particular conversation
    I want to go through all my chatlist and enter the chat with a another user


Background: chats in database

    Given   I am on the messages page
    And     I should see the following names: Marcus, Zhen, Jack, Hang


Scenario: click "show" to to see all messages with a particular user and chat with them
    When   I follow "Show"
    Then   I should see "Chats for Marcus"
    And    I should see the following names: Zhen, Jack, Hang
    But    I should not see the following names: A, B, C


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

