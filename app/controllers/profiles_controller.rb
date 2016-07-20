class ProfilesController < ApplicationController
  before_action :set_profile

  def update
    if @profile.save
      flash[:notice] = "Profile was updated"
      redirect_to profile_path(@profile)
    else
      flash[:alert] = "Your profile was not updated"
      render :edit
    end
  end

  def search
    @results = Profile.where(gender: params[:gender])
    @results = Profile.near(@profile.postcode, params[:distance].to_f).to_a
    @results.shift
    @results
  end

  private

  def profile_params
    params.require(:profile).permit(:biography, :drinks)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end

