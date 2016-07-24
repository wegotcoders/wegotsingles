Given(/^some users have registered$/) do
  users = YAML.load_file 'features/support/users.yml'

  users.each_with_index do |user_data, i|
    customer = instance_variable_set :"@customer_#{i + 1}", Customer.create!(
      :email => Faker::Internet.email,
      :username => Faker::Lorem.sentence,
      :date_of_birth => (18..55).to_a.sample.years.ago,
      :password => 'password', :password_confirmation => 'password')
    customer.profile.update(user_data)
    customer.confirm

    instance_variable_set :"@profile_#{i + 1}", customer.profile
  end
end

Given(/^Bob has signed in$/) do
  @customer = @customer_1
  step "they have signed in"
end

Given(/^Jess has signed in$/) do
  @customer = @customer_4
  step "they have signed in"
end

Given(/^Jess is looking at her profile page$/) do
  visit profile_path(@profile_4)
end

When(/^they select to search within (\d+)km of themselves$/) do |arg1|
  choose("#{arg1}km")
end

When(/^they press distance search button$/) do
  click_on "Search"
end

Then(/^a list of nearby profiles within 5km is diplayed$/) do
  expect(page).to have_content("Bob")
  expect(page).to_not have_content("Penny")
  expect(page).to_not have_content("Ric")
end

Then(/^a list of nearby profiles within 15km is displayed$/) do
  expect(page).to_not have_content("Jess")
  expect(page).to have_content("Bob")
  expect(page).to have_content("Penny")
  expect(page).to_not have_content("Ric")
end

Then(/^a list of nearby profiles within 150km is displayed$/) do
  expect(page).to_not have_content("Jess")
  expect(page).to have_content("Bob")
  expect(page).to have_content("Penny")
  expect(page).to have_content("Ric")
  expect(page).to have_selector("ol li:nth-child(1)", text: "Bob")
  expect(page).to have_selector("ol li:nth-child(2)", text: "Penny")
  expect(page).to have_selector("ol li:nth-child(3)", text: "Ric")
end
