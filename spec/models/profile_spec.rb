require 'rails_helper'

RSpec.describe Profile, type: :model do
	
	let(:profile){Profile.create!(location: 'EN11 8BX')}

  describe "geocoding" do 
  	it "automatically geocodes the model on save" do 
  		expect(profile.lat).to be_within(0.000001).of( 51.7557328)
  		expect(profile.lng.to_f).to eq(-0.0101774)
  	end
  
  end
end
