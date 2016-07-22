class PagesController < ApplicationController

	def home
		unless current_customer
			redirect_to new_customer_registration_path
		else
			redirect_to profile_path(current_customer.profile.id)
		end
	end

end
