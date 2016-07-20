require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile1){Profile.create!(postcode: 'EN11 8BX', latitude: "", longitude: "" )}
  let(:profile2){Profile.create!(postcode: 'SG12', latitude: "", longitude: "" )}
	
  describe "searching for locational matches" do 
    it "should return matches within 20 miles" do 
      expect(profile1.latitude).to be_within(0.000001).of(51.7557328)
    end
  end
end
