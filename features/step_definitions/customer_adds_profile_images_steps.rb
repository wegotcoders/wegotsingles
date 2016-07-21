When(/^they select an image that they would like to upload$/) do
  attach_file("Images", "spec/uploaders/profile.png")
  click_on "Update Profile"
end

Then(/^their image appears in their list of images$/) do
  image_path = "uploads/profile/images/#{@profile.id}/profile.png"
  expect(page).to have_css('img[alt="Profile Image"]')
  expect(page).to have_css('img[src*="' + image_path + '"]')
end

