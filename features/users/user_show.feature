Feature: Show Users
  As a visitor to the website
  I want to see registered users listed on the homepage
  so I can know if the site has users

    Scenario: Viewing users
      Given I exist as a user
      When I sign in with valid credentials
      Then I should see my name
