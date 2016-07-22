Feature: A customer edits their account details

  Background:
    Given they have a profile
    And they have signed in

  Scenario: A customer edits their date of birth
    When they visit the edit customer registration page
    And they fill in their password
    And they edit their date of birth
    And they click Update
    Then their changes are saved to their account
