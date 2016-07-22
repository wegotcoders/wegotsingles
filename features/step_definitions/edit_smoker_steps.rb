Given(/^they have created a profile$/) do
  step 'they have a profile'
end

When(/^they edit their smoking status$/) do
  check('Smoker')
  click_on "Update Profile"
end

Then(/^their smoking status changes$/) do
  pending # Write code here that turns the phrase above into concrete actions
end