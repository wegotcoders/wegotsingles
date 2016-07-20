Given(/^a person is registered$/) do
  @me = Profile.create!(name: "Jess", postcode: "EN11 8BX")
  @profile2 = Profile.create!(name: "Bob", postcode: "EN11 8BX")
  @profile3 = Profile.create!(name: "Penny", postcode: "SG12 0SY")
  @profile4 = Profile.create!(name: "Ric", postcode: "CB2 1TN")
end

Given(/^they are on their personal profile page$/) do
  visit profile_path(@me)
end

When(/^they select to search within (\d+)km of themselves$/) do |arg1|
  choose("Within #{arg1}km")
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
