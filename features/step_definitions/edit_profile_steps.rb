Given(/^they have a profile$/) do
  @customer = FactoryGirl.create(:customer)
  @customer.profile.update(customer: @customer, name: Faker::Name.name)
  @customer.save!
  @profile = @customer.profile
end

Given(/^they have signed in$/) do
  visit new_customer_session_path
  fill_in "Username", with: @customer.username
  fill_in "Password", with: "password"
  click_on "Log in"
end

When(/^they visit the edit profile page$/) do
  visit edit_profile_path(@profile)
end

When(/^they edit their biography$/) do
  fill_in "Biography", with: Faker::Lorem.paragraph
end

When(/^they tick the drinks checkbox$/) do
  check "Do you drink?"
end

When(/^they click Update Profile$/) do
  click_on "Update Profile"
end

When(/^they edit their desires$/) do
  fill_in "Desires", with: Faker::Lorem.paragraph
end

When(/^they select their religion in the select field$/) do
  select "Zoroastrianism", from: "profile_religious_beliefs"
end

Then(/^their changes are saved$/) do
  expect(page).to have_content("Profile was updated")
end

Then(/^their religion appears on the show page$/) do
  expect(page).to have_content("Religious beliefs: Zoroastrianism")
end
