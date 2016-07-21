Feature: Find profiles by gender

Background:
	Given some users have registered
  	And Bob has signed in
  	And Bob is looking at his profile page

Scenario: A customer selects a gender to search by
	When they select a gender type
  	And they press search button
	Then a list of filtered profiles is diplayed
