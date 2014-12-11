Feature: user login

Background: users in database

  Given the following users exist:
  | name  | password |
  | Bob   | secret   |
  | Sally | secret   |

Scenario: user tried to sign up with a valid username (happy path)
  Given I am on the Welcome page
  When I follow "Sign Up"
  Then I should be on the "Sign Up" page
  When I fill in "Name" with "Ben"
  And I fill in "Password" with "secret"
  And I press "Sign Up"
  Then I should be on the "Overview" page
  And I should see "Access tree database"

Scenario: user tried to sign in with proper credentials (happy path)
  Given I am on the Welcome page
  When I fill in "Name" with "Bob"
  And I fill in "Password" with "secret"
  And I press "Sign In"
  Then I should be on the "Overview" page

Scenario: user tried to sign in with bad credentials (sad path)
