Feature: Weight Management
  In order to stay in good shape
  As a user
  I want to follow my weight


    Scenario: User creates a valid pesee
      Given I am logged in
      When I enter a pesee with valid pesee data
      Then I should see a successful pesee create message

    Scenario: User sees his pesees
      Given I am logged in
      When I enter a pesee with valid pesee data
      When I want to see all my pesees
      Then I should see a table with my pesee

    Scenario: User has no pesee
      Given I am logged in
      When I see the dashboard
      Then I should see I have no pesee