class ProfilesController < ApplicationController
  before_action :set_profile, :only => [:update, :show, :edit]

  def update
    weight_params = {weight_unit: params[:weight_unit], stones: params[:stones],
                      pounds: params[:pounds], weight: params[:profile][:weight]}

    @profile.weight = Profile.calculate_weight(weight_params)
    if @profile.update(profile_params)

      flash[:notice] = "Profile was updated"
      redirect_to profile_path(@profile)
    else
      flash[:alert] = "Your profile was not updated"
      render :edit
    end
  end

  def search
    @results = Profile.where('id != ?', current_customer.profile.id)

    if params[:gender]
      @results = @results.where(gender: params[:gender])
    end

    if params[:distance]
      @results = @results.near(current_customer.profile.postcode, params[:distance].to_f)
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:biography, :drinks, :weight, :desires,
      :postcode, :name, :gender, :latitude, :longitude,:industry, :occupation,
      :ethnicity, :religious_beliefs)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end

