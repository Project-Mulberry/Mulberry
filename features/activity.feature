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