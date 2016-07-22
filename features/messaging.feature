Feature: Messaging

  Background:
    Given some users have registered
    And Bob has signed in
    And Bob is looking at his profile page

  @wip
  Scenario: A customer can view inbox
    When Bob clicks inbox
    Then he is redirected to his inbox

  Scenario: A customer can create message
  Scenario: A customer can reply to a message
