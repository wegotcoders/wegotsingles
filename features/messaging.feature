Feature: Messaging

  Background:
    Given some users have registered
    And Bob has signed in
    And Bob is looking at his profile page
    And Bob clicks inbox

  Scenario: A customer can view inbox
    Then he is redirected to his inbox
  Scenario: A customer can create a message
    When he clicks new message
    And he writes a message
    And he selects a receiver
    And he presses send
    Then the message appears in his outbox
    And the message appears in the receiver's inbox
  Scenario: A customer can reply to a message
