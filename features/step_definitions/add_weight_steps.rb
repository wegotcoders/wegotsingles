Given(/^they sign in$/) do
  visit new_customer_session_path
  fill_in "Username", with: "fred"
  fill_in "Password", with: "password"
  click_on "Log in"
end

Given(/^they are on their edit profile page$/) do
  visit edit_profile_path(@profile)
end

When(/^they enter a weight$/) do
  fill_in "Weight", with: 90
end

When(/^they update their profile$/) do
   click_on "Update Profile"
end

Then(/^it displays the new weight$/) do
  expect(page).to have_content("90")
end