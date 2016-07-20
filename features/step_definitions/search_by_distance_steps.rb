Given(/^a person is registered$/) do
  @me = Profile.create!(postcode: "EN11 8BX")
  @profile2 = Profile.create!(postcode: "EN11 8BX")
  @profile3 = Profile.create!(postcode: "CM20 1WG")
  @profile4 = Profile.create!(postcode: "LS1 1AE")
end

Given(/^they are on their personal profile page$/) do
  visit profile_path(@me)
end


When(/^they select a distance to search by$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^they press distance search button$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^a list of nearby profiles is diplayed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end