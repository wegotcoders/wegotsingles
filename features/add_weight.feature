Feature: Customer adds weight to profile

Background:
  Given they have a profile
  And they sign in
  And they are on their edit profile page


Scenario: Customer adds their weight in metric units
  When they enter a weight
  And they update their profile
  Then it displays the new weight