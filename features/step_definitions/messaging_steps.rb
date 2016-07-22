When(/^Bob clicks inbox$/) do
  click_on "Inbox"
end

Then(/^he is redirected to his inbox$/) do
  expect(page).to redirect_to(profile_messages_path(@profile_1))
end
