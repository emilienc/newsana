Feature: Switch language
  In order to understand what is written
  As a user
  I want to choose a language I know


    Scenario: User switches lnaguage
      Given I am logged in
      When I choose french
      Then I should see a french site
      When I choose english
      Then I should see an english site

     