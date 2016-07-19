Feature: A customer edits their profile

  Scenario: A customer edits their profile biography
    Given they have a profile
    And they have signed in
    When they visit the edit profile page
    And they edit their biography
    Then their changes are saved