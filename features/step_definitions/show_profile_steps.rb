
Given(/^they both have a profile$/) do

  @customer1 = Customer.create!(username: "fred", email: "fred@bloggs.com",
    password: "password", password_confirmation: "password",
    confirmation_sent_at: Time.now - 1.day,
    confirmed_at: Time.now, date_of_birth: Date.new(1993,4,5))

  @customer2 = Customer.create!(username: "sally", email: "sally@hello.com",
    password: "password", password_confirmation: "password",
    confirmation_sent_at: Time.now - 1.day,
    confirmed_at: Time.now, date_of_birth: Date.new(1988, 7, 3))

  @customer1.profile.update(
                              name: "Timmy",
                              biography: "hello world i'm so awesome",
                              customer: @customer1,
                              )
  @customer2.profile.update(
                              name: "sally",
                              biography: "hello dateables, check me out",
                              customer: @customer2,
                              postcode: "EN11 8BX",
                              )
  @profile1 = @customer1.profile
  @profile2 = @customer2.profile
end

Given(/^Customer1 has signed in$/) do
  visit new_customer_session_path
  fill_in "Username", with: @customer1.username
  fill_in "Password", with: @customer1.password
  click_on "Log in"
end

When(/^they visit Customer2 profile page$/) do
  visit profile_path(@profile2)
end

Then(/^they should see Customer2 profile fields$/) do
  expect(page).to have_css("h1", text: @profile2.name.capitalize)
  expect(page).to have_css("dd", text: @profile2.biography)
  expect(page).to have_css("dd", text: @profile2.postcode)
  # expect(page).to have_css('img[src="picture.jpg"][alt=India]')
end