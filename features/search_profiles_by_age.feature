Feature: Search profiles by age-range

Background:
	Given some users have registered
  	And Bob has signed in
  	And Bob is looking at his profile page

Scenario: A customer selects an age range to search by
	When they select an age range
  	And they press search button
	Then a list of age-filtered profiles is diplayed