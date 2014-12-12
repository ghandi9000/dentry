Feature: user sign in

Background: users in database

  Given the following users exist:
  | email                  | name  | password |
  | bob@gmail.com          | Bob   | secret   |
  | sally@gmail.com        | Sally | secret   |
  | noah.v.peart@gmail.com | Noah  | secret   |

Scenario: user tried to sign in with proper credentials (happy path)
  Given I am on the Welcome page
  When I fill in "Email" with "noah.v.peart@gmail.com"
  And I fill in "Password" with "secret"
  And I press "Sign In"
  Then I should be on the "Overview" page

Scenario: user tried to sign in with bad credentials (sad path)
  Given I am on the Welcome page
  When I fill in "Email" with "dude@hi.com"
  And I fill in "Password" with "secret"
  And I press "Sign In"
  Then I should be on the Welcome page
  And I should see "Sorry, username/password invalid"
