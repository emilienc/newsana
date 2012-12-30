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
      