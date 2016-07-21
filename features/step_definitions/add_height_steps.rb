Given(/^they are registered with the site$/) do
@customer = Customer.create!(username: "jasmine", email: "fred@bloggs.com",
  password: "password", password_confirmation: "password",
  confirmation_sent_at: Time.now - 1.day,
  confirmed_at: Time.now, date_of_birth: Date.new(1992,4,15))

@profile = Profile.create!(
  biography: "hello world i'm quite tall",
  name: "jasmine",
  customer: @customer)
end

When(/^they enter a height in cms$/) do
  fill_in "Height", with: 180
end

Then(/^it displays their height$/) do
  @profile.reload
  expect(@profile.height).to eq(180)
  expect(page).to have_content("180")
end