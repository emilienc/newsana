Feature: Exercise Management
  In order to stay in good shape
  As a user
  I want to follow my exercises


    Scenario: User creates a valid exercise
      Given I am logged in
      When I enter a valid exercise
      Then I should see a successful exercise create message

    Scenario: User creates an invalid exercise
      Given I am logged in
      When I enter an invalid exercise
      Then I should see an error exercise create message

    Scenario: User sees his exercises
      Given I am logged in
      When I enter a valid exercise
      When I want to see all my exercises
      Then I should see a table with my exercise

    Scenario: User sees his exercises
      Given I am logged in
      When I enter a valid exercise
      When I want to see all my exercises
      Then I should see a table with my exercise
      When I delete an exercise
      Then I should see no more exercise

    Scenario: User has no exercise
      Given I am logged in
      When I see the dashboard
      Then I should see I have no pesee