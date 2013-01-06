Feature: Create Repas
  In order to stay in good shape
  As a user
  I want to follow my repas


    Scenario: User create a valid repas
      Given I am logged in
      When I create a valid repas
      Then I should see a successful repas create message

	  Scenario: User create a bad repas
      Given I am logged in
      When I create a bad repas
      Then I should not see a successful repas create message
    