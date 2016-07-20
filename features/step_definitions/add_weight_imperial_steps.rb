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
  select 'Imperial', from: 'weight_unit'
end

When(/^they enter weight in Stones and Pounds$/) do
  fill_in "stones", with: 15
  fill_in "pounds", with: 10
end

When(/^they save the changes to their profile$/) do
  click_on "Update Profile"
end

Then(/^the weight is displayed in imperial units$/) do 
  expect(page).to have_content("Stones: 15")
  expect(page).to have_content("Pounds: 10")
end