Feature: User can manually add tree

Scenario: Add a tree
  Given I am on the Moose home page
  When I follow "Add new tree"
  Then I should be on the "Create New Tree" page
  When I fill in "Plot" with "1"
  And I fill in "Tree ID" with "19"
  And I select "ABBA" from "Species"
  And I fill in "DBH" with "5.3"
  And I fill in "Height" with "10.1"
  And I fill in "Notes" with "This is a test"
  And I press "Save Changes"
  Then I should be on the Moose home page

Scenario: Reset tree index
  Given I am on the Moose home page
  And I follow "Reset"
  Then I should be on the Moose home page
