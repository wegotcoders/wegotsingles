Given(/^that they are registered$/) do
  @profile1 = Profile.create!(name: "Joe Bloggs", gender:"male")
  @profile2 = Profile.create!(name: "Mary Blythe", gender:"female")
end

Given(/^they have signed in$/) do
  # to be done via Devise later
end

Given(/^they are on their dashboard page$/) do
  visit profiles_show_path
end

When(/^they select a gender type$/) do
  choose('Female')
end

When(/^they press search button$/) do
  click_button('Search')
end

Then(/^a list of filtered profiles is diplayed$/) do
  expect(page).to have_content('Mary Blythe')
end
