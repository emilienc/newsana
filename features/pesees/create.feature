Feature: Create Pesee
  In order to stay in good shape
  As a user
  I want to register my weight


    Scenario: User create a valid pesee
      Given I am logged in
      When I enter a pesee with valid pesee data
      Then I should see a successful pesee create message