Given(/^that they are registered$/) do
  @profile1 = Profile.create!(name: "Joe Bloggs", gender:"male")
  @profile2 = Profile.create!(name: "Mary Blythe", gender:"female")
end

Given(/^they are on their dashboard page$/) do
  visit profile_path(@profile1)
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
