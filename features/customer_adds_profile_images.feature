Feature: Upload Profile Images

Background:
  Given they have a profile
    And they have signed in
    
  Scenario: A customer adds an image to their list of images
    When they visit the edit profile page
      And they select an image that they would like to upload
    Then their changes are saved
      And their image appears in their list of images
   
