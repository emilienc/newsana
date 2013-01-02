Feature: Create Pesee
  In order to stay in good shape
  As a user
  I want to follow my weight


    Scenario: User create a valid pesee
      Given I am logged in
      When I enter a pesee with valid pesee data
      Then I should see a successful pesee create message

     Scenario: User manages his pesees
      Given I am logged in
      When I want to see all my pesees
      Then I should see a table with my pesee