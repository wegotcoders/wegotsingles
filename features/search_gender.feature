Feature: Find profiles by gender

Background:
	Given they are registered
	And they have signed in
	And they are on their dashboard page

Scenario: A customer selects a gender to search by
	When they select a gender type
	And they press search button
	Then a list of filtered profiles is diplayed
