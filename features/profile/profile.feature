Feature: Create and Update Profile
  In order to compute some figures
  As a user
  I want to enter some extras infos on my profile


    Scenario: User create a profile
      When I sign up with valid user data
      Then I should have a link to create my profile
      When I create a valid profile
      Then I should see a profile created message
      Then I should have a link to edit my profile
      When I update my profile
      Then I should see a profile updated message
      Then I should have a link to edit my profile

    Scenario: User updates facebook profile
      Given I am not logged in
      When I Sign in with Facebook
      Then I should see a successful facebook sign up message
      When I update my profile
      Then I should see a profile updated message
      When I enter a pesee with valid pesee data
      Then I should see a successful pesee create message
      Then I should see my IMC
      When I sign out
      Then I should see a signed out message
      When I sign in with valid credentials
      Then I see a successful sign in message
      Then I should see my IMC