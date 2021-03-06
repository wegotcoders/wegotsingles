Feature: Messaging

  Background:
    Given some users have registered
    And Bob has signed in
    And Bob is looking at his profile page
    And Bob clicks inbox

  Scenario: A customer can view inbox
    Then he is redirected to his inbox

  @javascript
  Scenario: A customer can create a message
    When he clicks new message
    And he writes a message
    And he clicks on a receiver
    And he presses send
    Then the message appears in his outbox
    And the message appears in the receiver's inbox
  
  Scenario: A customer can create a message without javascript
    When he clicks new message
    And he writes a message
    And he selects a receiver
    And he presses send
    Then the message appears in his outbox
    And the message appears in the receiver's inbox

  Scenario: A customer can reply to a message
    When he receives a message
    And he clicks the reply button
    And he writes a message
    And he presses send
    Then the message should appear beneath the original message
    And the message should appear in the original sender's inbox
