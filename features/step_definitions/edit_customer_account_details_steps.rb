When(/^they visit the edit customer registration page$/) do
  visit edit_customer_registration_path
end

When(/^they fill in their password$/) do
  fill_in "Current password", with: "password"
end

When(/^they edit their date of birth$/) do
  fill_in "Date of Birth", with: 27.years.ago
end

When(/^they click Update$/) do
  click_on "Update"
end

Then(/^their changes are saved to their account$/) do
  expect(page).to have_content("Your account has been updated successfully.")
end

