Feature: Customer adds weight in imperial to Profile

Background:
	Given they have a profile
	And they have signed in
	And they are on the Profile page

Scenario: Customer adds their weight in imperial units to their Profile
	When they select Imperial units for weight
	And  they enter weight in Stones and Pounds
	And they save the changes to their profile
	Then the weight is stored in the profile