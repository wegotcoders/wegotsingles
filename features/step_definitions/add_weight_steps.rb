Given(/^that they are registered$/) do
  @profile = Profile.create!()
end

Given(/^they have signed in$/) do
  visit new_customer_session_path
  fill_in "Username", with: "fred"
  fill_in "Password", with: "password"
  click_on "Log in"
end

Given(/^they are on their edit profile page$/) do
  visit edit_profile_path(@profile)
end

When(/^they enter a weight$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^they update their profile$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^it displays the new weight$/) do
  pending # Write code here that turns the phrase above into concrete actions
end