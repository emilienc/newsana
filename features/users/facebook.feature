Feature: Facebook signs in
  In order to ease my login 
  As a user
  I want to sign in with Facebook

  Scenario: User signs in with Facebook
    Given I am not logged in
    When I Sign in with Facebook
    Then I should see a successful facebook sign up message
  