require 'rails_helper'

RSpec.describe Profile, type: :model do
<<<<<<< HEAD
  pending "add some examples to (or delete) #{__FILE__}"
=======
=begin
	
	let(:profile1){Profile.create!(location: 'EN11 8BX', latitude: , longitude: )}
	let(:profile2){Profile.create!(location: 'SG12', latitude: , longitude: )}

  describe "searching for locational matches" do 
  	it "should return matches within 20 miles" do 
  		expect(profile1.latitude).to be_within(0.000001).of(51.7557328)
  	end
  end
=end
>>>>>>> af5f483... Added Date of Birth field to customer
end
