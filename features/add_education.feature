Feature: A customer add education to their Profile

  @wip
  Scenario: A customer edits their profile to add education
    Given they have created a profile
      And they have signed in
    When they visit the edit profile page
      And they add their education level
      And they click Update Profile
    Then their changes are saved