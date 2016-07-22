class ProfilesController < ApplicationController
  before_action :set_profile, :only => [:update, :show, :edit]
  before_action :access

  def update
    weight_params = {weight_unit: params[:weight_unit], stones: params[:stones],
                      pounds: params[:pounds], weight: params[:profile][:weight]}

    if @profile.update(profile_params)
      # Yuk!
      @profile.weight = Profile.calculate_weight(weight_params)
      @profile.save!

      flash[:notice] = "Profile was updated"
      redirect_to profile_path(@profile)
    else
      flash[:alert] = "Your profile was not updated"
      render :edit
    end
  end

  def search
    @results = Profile.where('profiles.id != ?', current_customer.profile.id)

    if params[:gender]
      @results = @results.where(gender: params[:gender])
    end

    if params[:distance]
      @results = @results.near(current_customer.profile.postcode, params[:distance].to_f)
    end
  
    if params[:age]
      date_from = Date.today - (params[:age][:max]).to_i.years
      date_to = Date.today - (params[:age][:min]).to_i.years 
      @results = @results.joins(:customer).where('customers.date_of_birth > ? AND customers.date_of_birth < ?', date_from, date_to)
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:biography, :drinks, :weight, :desires,
      :postcode, :name, :gender, :latitude, :longitude,:industry, :occupation,
      :ethnicity, :religious_beliefs, :height)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def access
    unless current_customer
      redirect_to new_customer_registration_path
    end
  end
end

