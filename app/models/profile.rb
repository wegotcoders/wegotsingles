Profile = Struct.new(:postcode, :latitude, :longitude) do 
	def self.create!
		Rails.logger.warn "NB Profile is using a struct"
		true
	end


end