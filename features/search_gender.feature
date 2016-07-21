Feature: Find profiles by gender

Background:
	Given that they are registered
	And that they have signed in
	And they are on their dashboard page

Scenario: A customer selects a gender to search by
	When they select a gender type
	And they press search button
	Then a list of filtered profiles is diplayed
