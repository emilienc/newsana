Feature: Create Repas
  In order to stay in good shape
  As a user
  I want to follow my repas


    Scenario: User create a valid repas
      Given I am logged in
      When I enter a repas with valid repas data
      Then I should see a successful repas create message

     Scenario: User manages his repas
      Given I am logged in
      When I go to see all my repas
      Then I should see a table with my repas