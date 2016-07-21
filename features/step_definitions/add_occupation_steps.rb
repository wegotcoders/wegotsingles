Given(/^they have a profile$/) do
  @customer = Customer.create!(username: "harry" , email: "harry@yahoo.co.uk", date_of_birth: Date.new(1962,10,30), 
  password: 'password', password_confirmation: 'password', confirmation_sent_at: Time.now - 1.day, confirmed_at: Time.now)
  @profile = Profile.create!(occupation: "" , industry: "" ,customer: @customer)
end

When(/^they select an industry$/) do
  select 'Health', from: "Industry"
end

When(/^they enter an occupation$/) do
  fill_in "Occupation", with: "Teacher"
  save_and_open_page
end

When(/^they update their profile$/) do
  click_on "Update Profile"
end

Then(/^their profile changes are saved$/) do
  expect(page).to have_content("Profile was updated")
end