When(/^they select an age range$/) do
  fill_in "Minimum Age", with: 19
  fill_in "Maximum Age", with: 27
end

Then(/^a list of age\-filtered profiles is diplayed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end