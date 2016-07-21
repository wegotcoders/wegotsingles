Given(/^they have created a profile$/) do
  @customer = Customer.create!(username: "fred", date_of_birth: Date.new(1990,12,12), email: "fred@bloggs.com",
    password: "password", password_confirmation: "password",
    confirmation_sent_at: Time.now - 1.day,
    confirmed_at: Time.now)
  @profile = Profile.create!(customer: @customer, smoker: true)
end

When(/^they edit their smoking status$/) do
  check('Smoker')
  click_on "Update Profile"
end

Then(/^their smoking status changes$/) do
  pending # Write code here that turns the phrase above into concrete actions
end