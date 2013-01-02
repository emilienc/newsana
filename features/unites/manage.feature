Feature: Create Unite
  In order to ease repas creation
  As an Admin
  I want to create a limited choice of units


    Scenario: Admin adds an unite
      Given I am logged in as Admin
      When I enter a unite with valid name
      Then I should see a successful unite create message

    Scenario: Admin manages unites
      Given I am logged in as Admin
      When I want to see all unites
      Then I should see a table with all unites

    Scenario: User cannot change unites
      Given I am logged in
      When I want to see all unites
      Then Access should be denied