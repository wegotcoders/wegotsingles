Feature: A customer edits their profile for smoking

  Scenario: A customer edits their profile to show if they are a smoker
    Given they have created a profile
      And they have signed in
    When they visit the edit profile page
      And they edit their smoking status
    Then their changes are saved
      # And their smoking status changes