Feature: decide on an recommended activity

  As a user
  So that I can actually go on a real date
  I want to choose to accept/declind an recomended activity


Background: chats in database

    Given the following profiles exist:
    | name    | location | education   | career              | phone	  | password	| gender	| birthday	    | sexuality	| height | profile_photo |
    | Marcus  | NY       | Bachelor    | Student             | 1534643573 | 1           | m         | 01-Jan-2000	| 1		    | 1      | 1             |
    | Zhen    | NY       | Master      | Student             | 5437525723 | 1           | f         | 01-Jan-2000	| 1		    | 1      | 1             |
    | Jack    | NY       | PhD         | Software Engineer   | 4668756566 | 1           | m         | 01-Jan-2000	| 1		    | 1      | 1             |
    | Hang    | NY       | High School | Unemployed          | 4527772777 | 1           | m         | 01-Jan-2000	| 1		    | 1      | 1             |

    Given the following messages exist:
    | sender_uid | receiver_uid | key     | message                                 | timestamp             | is_read  |
    | 1          | 2            | <1>-<2> | Hello Zhen, How are you!                | 01-Oct-2022 11:30:00  | true     |
    | 2          | 1            | <1>-<2> | Hi Marcus!                              | 01-Oct-2022 13:30:00  | true     |
    | 1          | 2            | <1>-<2> | Interested in the recommended activity? | 01-Oct-2022 15:00:00  | false    |
    | 1          | 3            | <1>-<3> | Hi, what\'s up                          | 01-Oct-2022 12:00:00  | false    |
    | 3          | 1            | <1>-<3> | Hey! How is it going?                   | 01-Oct-2022 13:00:00  | false    |
    | 4          | 1            | <1>-<4> | Morning!                                | 01-Oct-2022 10:00:00  | false    |
    | 3          | 4            | <3>-<4> | Wanna eat out?                          | 01-Oct-2022 18:00:00  | true     |

    Given the following coupons exist:
    | name     | message                                                                                                | location                       | original_price | discount_price | advertiser      |
    | Food     | Both of you love Italian food, check out this amazing Italian restaurant and enjoy our special coupon! | 116 Street, New York, NY 10000 | 1000.00        | 50.00          | Columbia Dining |
    | Music    | Both of you love Jazz Music, check out this amazing Jazz bar and enjoy our special coupon!             | 116 Street, New York, NY 10000 | 20.00          | 8.00           | Columbia Dining |
    | Sports   | Both of you love Tennis, check out this amazing tennis club and enjoy our special coupon!              | 116 Street, New York, NY 10000 | 100.00         | 20.00          | Columbia Dining |

    Given the following activities exist:
    | status    | coupon_id | datetime            | fst_uid | fst_accept | snd_uid | snd_accept |
    | DONE      | 2         | 2022-10-01 13:31:00 | 1       | true       | 2       | true       |
    | PENDING   | 3         | 2022-10-02 15:00:00 | 1       | false      | 2       | true       |
    | PENDING   | 1         | 2022-10-03 18:00:00 | 1       | false      | 2       | false      |
    | PENDING   | 2         | 2022-10-03 18:00:00 | 3       | false      | 4       | false      |

    Given  I am on the login page
    Then   I logged in as a user
    And    I press "Log In"
    And    I am on the messages page


Scenario: access an activity from a conversation
    Then   I should see "Your Chats"
    When   I follow "Show"
    Then   I should see "Conversation with Zhen"
    When   I follow "Both of you love Jazz Music"
    Then   I should see "Music"
    When   I follow "Back to Chat"
    Then   I should see "Conversation with Zhen"


Scenario: accept an activity that the other user have already accepted
    Then   I should see "Your Chats"
    When   I follow "Show"
    Then   I should see "Conversation with Zhen"
    When   I follow "Both of you love Tennis"
    Then   I should see "Sports"
    And    I should see "The other user have already accepted the invitation!"
    When   I follow "Accept Invitation"
    Then   I should see "This activity has been scheduled!"


Scenario: accept an activity that the other user hasn't accepted yet
    Then   I should see "Your Chats"
    When   I follow "Show"
    Then   I should see "Conversation with Zhen"
    When   I follow "Both of you love Italian food"
    Then   I should see "Food"
    When   I follow "Accept Invitation"
    Then   I should see "Waiting for the other user to accept the invitation!"


Scenario: try to access an valid activity
    When   I try to go to the URL "/activities/1"
    Then   I should see "Activity Information"


Scenario: try to navigate to an invalid activity
    When   I follow "Log Out"
    And    I follow "Sign Up"
    Given  I fill in the following questions: Phone, Password
    When   I press "Sign Up"
    And    I fill in the following questions: Name, Gender, Sexuality, Location, Career, Height, Profile Photo URL, Interest, Prompt
    And    I press "Submit"
    Then   I should be on the home page
    When   I try to go to the URL "/activities/1"
    Then   I should be on the home page