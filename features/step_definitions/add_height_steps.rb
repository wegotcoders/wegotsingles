Given(/^they are registered with the site$/) do
  step 'they have a profile'
end

When(/^they enter a height in cms$/) do
  fill_in "Height", with: 180
end

Then(/^it displays their height$/) do
  @profile.reload
  expect(@profile.height).to eq(180)
  expect(page).to have_content("180")
end