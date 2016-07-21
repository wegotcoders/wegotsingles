When(/^they select an age range$/) do
  fill_in "age_min", with: 19
  fill_in "age_max", with: 27
end

Then(/^a list of age\-filtered profiles is diplayed$/) do
  expect(page).to_not have_content("Bob")  
  expect(page).to have_content("Penny")
  expect(page).to have_content("Ric")
  expect(page).to_not have_content("Jess")
end