When(/^they select an industry$/) do
  select 'Health', from: "Industry"
end

When(/^they enter an occupation$/) do
  fill_in "Occupation", with: "Teacher"
end

Then(/^their profile changes are saved$/) do
  expect(page).to have_content("Profile was updated")
end