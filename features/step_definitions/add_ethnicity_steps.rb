When(/^they add their ethnicity$/) do
  select "White", from: 'profile[ethnicity]'
  @profile.reload
end
