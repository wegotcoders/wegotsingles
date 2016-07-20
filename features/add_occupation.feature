Feature: Add occupation to Profile

Background:
	Given they have a profile
	And they have signed in

Scenario: A customer adds an occupation to their Profile
	When they visit the edit profile page
	And they select an industry 
	When they enter an occupation
	And they update their profile
	Then their profile changes are saved