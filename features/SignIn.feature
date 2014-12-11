Feature: user sign in

Background: users in database

  Given the following users exist:
  | name  | password |
  | Bob   | secret   |
  | Sally | secret   |

Scenario: user tried to sign in with proper credentials (happy path)
  Given I am on the Welcome page
  When I fill in "Name" with "Bob"
  And I fill in "Password" with "secret"
  And I press "Sign In"
  Then I should be on the "Overview" page

Scenario: user tried to sign in with bad credentials (sad path)
  Given I am on the Welcome page
  When I fill in "Name" with "Ben"
  And I fill in "Password" with "secret"
  And I press "Sign In"
  Then I should be on the Welcome page
  And I should see "Sorry, username/password invalid"
