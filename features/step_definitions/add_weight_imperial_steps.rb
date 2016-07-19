Given(/^that they are registered$/) do
  @profile = Profile.create!()
end

Given(/^they sign in to the system$/) do
  visit new_customer_session_path
  fill_in "Username", with: "Rupert"
  fill_in "Password", with: "password"
  click_on "Log in"
end

Given(/^they are on the Profile page$/) do
  visit edit_profile_path(@profile)
end

When(/^they select Imperial units for weight$/) do
  select 'Imperial', from: 'Weight-Unit'
end

When(/^they enter weight in Stones and Pounds$/) do
  fill_in "stones", with: 12
  fill_in "pounds", with: 6
end

When(/^they save the changes to their profile$/) do
  click_on "Update Profile"
end

Then(/^the weight is displayed in imperial units$/) do
  expect(page).to have_content("Stones: 12")
  expect(page).to have_content("Pounds: 6")
end