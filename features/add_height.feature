Feature: Customer adds height to profile

Background:
  Given they are registered with the site
  And they sign in
  And they are on their edit profile page


Scenario: Customer adds their weight in metric units
  When they enter a height in cms
  And they update their profile
  Then it displays their height