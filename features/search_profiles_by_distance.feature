Feature: Search profiles by distance

Background:
	Given some users have registered
  	And Jess has signed in
  	And Jess is looking at her profile page

Scenario: A customer searches within 5 kilometres
	When they select to search within 5km of themselves
		And they press distance search button
	Then a list of nearby profiles within 5km is diplayed

Scenario: A customer searches within 15 kilometres
	When they select to search within 15km of themselves
		And they press distance search button
	Then a list of nearby profiles within 15km is displayed

Scenario: A customer searches within 150 kilometres
	When they select to search within 150km of themselves
		And they press distance search button
	Then a list of nearby profiles within 150km is displayed