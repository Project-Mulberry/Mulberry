Feature: decide on an recommended activity

  As a user
  So that I can actually go on a real date
  I want to choose to accept/declind an recomended activity


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

    Given the following coupons exist:
    | name            | message                                                                                             | location                       | original_price | discount_price | advertiser      |
    | Romantic Dining | We found both of you love Italian food, so we reserved a table with coupon for you! Check this out! | 116 Street, New York, NY 10000 | 1000.00        | 50.00          | Columbia Dining |
    | Romantic Dining | We found both of you love Italian food, so we reserved a table with coupon for you! Check this out! | 116 Street, New York, NY 10000 | 20.00          | 8.00           | Columbia Dining |
    | Romantic Dining | We found both of you love Italian food, so we reserved a table with coupon for you! Check this out! | 116 Street, New York, NY 10000 | 100.00         | 20.00          | Columbia Dining |

    Given the following activities exist:
    | status    | coupon_id | datetime            | fst_uid | fst_accept | snd_uid | snd_accept |
    | PENDING   | 2         | 2022-01-01 18:00:00 | 1       | true       | 2       | false      |
    | DONE      | 3         | 2022-01-01 18:00:00 | 1       | true       | 2       | true       |
    | SCHEDULED | 1         | 2022-01-01 18:00:00 | 1       | true       | 2       | true       |
    | PENDING   | 2         | 2022-01-01 18:00:00 | 3       | true       | 4       | false      |

    Given  I am on the login page
    Then   I logged in as a user
    And    I press "Log In"
    And    I am on the messages page


Scenario: access an activity from a conversation
    Then   I should see "Your Chats"


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