Given(/^Bob is looking at his profile page$/) do
  visit profile_path(@profile_1)
end

When(/^they select a gender type$/) do
  choose('Female')
end

When(/^they press search button$/) do
  click_button('Search')
end

Then(/^a list of filtered profiles is diplayed$/) do
  expect(page).to have_content('Penny')
  expect(page).to have_content('Jess')
end
