@wip
Feature: Search profiles by distance

Background:
	Given a person is registered
	And that they have signed in
	And they are on their dashboard page

Scenario: A customer selects a gender to search by
	When they select a distance to search by
	And they press distance search button
	Then a list of nearby profiles is diplayed