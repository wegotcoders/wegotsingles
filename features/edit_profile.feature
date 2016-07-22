Feature: A customer edits their profile

  Background:
    Given they have a profile
    And they have signed in

  Scenario: A customer edits their profile biography
    When they visit the edit profile page
    And they edit their biography
    And they click Update Profile
    Then their changes are saved

  Scenario: A customer indicates whether they drink
    When they visit the edit profile page
    And they tick the drinks checkbox
    And they click Update Profile
    Then their changes are saved

  Scenario: A customer edits their desires
    When they visit the edit profile page
    And they edit their desires
    And they click Update Profile
    Then their changes are saved

  Scenario: A customer edits their religious beliefs
    When they visit the edit profile page
    And they select their religion in the select field
    And they click Update Profile
    Then their changes are saved
    And their religion appears on the show page

