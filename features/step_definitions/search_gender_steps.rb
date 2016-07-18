Given(/^they are registered$/) do
  Profile.new(postcode: 'EN118BX', latitude: '51.76000699999999', longitude: '-0.015042')
end

Given(/^they have signed in$/) do
  # to be done via Devise later
end

Given(/^they are on their dashboard page$/) do
  visit profile_dashboard_path
end

When(/^they select a gender type$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^they press search button$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^a list of filtered profiles is diplayed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end