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

  private

  def profile_params
    params.require(:profile).permit(:biography, :drinks)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
