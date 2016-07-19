Given(/^they have a profile$/) do
  @customer = Customer.create!(username: "fred", email: "fred@bloggs.com",
    password: "password", password_confirmation: "password",
    confirmation_sent_at: Time.now - 1.day,
    confirmed_at: Time.now)
  @profile = Profile.create!(customer: @customer)
end

Given(/^they have signed in$/) do
  visit new_customer_session_path
  fill_in "Username", with: "fred"
  fill_in "Password", with: "password"
  click_on "Log in"
end

When(/^they visit the edit profile page$/) do
  visit edit_profile_path(@profile)
end

When(/^they edit their biography$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^their changes are saved$/) do
  pending # Write code here that turns the phrase above into concrete actions
end