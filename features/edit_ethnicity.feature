Feature: A customer edits their profile for ethnicity

  Scenario: A customer edits their profile to add ethnicity
    Given they have created a profile
      And they have signed in
    When they visit the edit profile page
      And they add their ethnicity
      And they click Update Profile
    Then their changes are saved