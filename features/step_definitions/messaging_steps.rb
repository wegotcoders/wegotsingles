Given(/^Bob clicks inbox$/) do
  click_on "Inbox"
end

When(/^he clicks new message$/) do
  click_on "New message"
end

When(/^he writes a message$/) do
  fill_in "Content", with: (@content = Faker::Lorem.paragraph)
end

When(/^he clicks on a receiver$/) do
  click_on @profile_4.name
end

When(/^he selects a receiver$/) do
  select @profile_4.name, from: "message_receiver_id"
end

When(/^he presses send$/) do
  click_on "Send"
end

When(/^he receives a message$/) do
  @message = Message.create!(content: Faker::Lorem.paragraph, 
	    		     sender_id: @profile_4.customer.id,
			     receiver_id: @profile_1.customer.id)
  visit current_path
end

When(/^he clicks the reply button$/) do
  click_on "Reply"
end

Then(/^the message should appear beneath the original message$/) do
  expect(page).to have_content(@content)
  @reply = Message.find_by(content: @content)
  expect(@reply.replied_to_id).to eq(@message.id)
end

Then(/^the message should appear in the original sender's inbox$/) do
  click_on "Log Out"
  step "Jess has signed in"
  click_on "Inbox"
  expect(page).to have_content(@content)
end

Then(/^he is redirected to his inbox$/) do
  expect(page).to have_content("Your Messages")
end

Then(/^the message appears in his outbox$/) do
  click_on "Outbox"
  expect(page).to have_content(@content)
end

Then(/^the message appears in the receiver's inbox$/) do
  click_on "Log Out"
  step "Jess has signed in"
  click_on "Inbox"
  expect(page).to have_content(@content)
end
