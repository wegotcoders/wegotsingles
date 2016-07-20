Feature: A customer may view another customer profile

  Scenario: Customer1 views Customer2 profile page
    Given they both have a profile
      And Customer1 has signed in
    When they visit Customer2 profile page
    Then they should see Customer2 profile fields