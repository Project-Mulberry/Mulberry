Feature: start a chat

    As a user
    So that I can start on a particular conversation
    I want to go through all my current chats and enter the chat with a another user


    Background: the profile creation form is shown
      Given the following questions exist: Phone, Name, Age, Gender, Sexuality, Height, Location, Education, Career, Hobbies


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