Feature: Customer registration
  @wip
  Scenario: A customer registers with the site
    Given they're on the registration page
    When they provide a valid username
    And they provide an email address
    And they provide a date of birth
    And they provide a password
    And they click sign up
    Then they are registered
