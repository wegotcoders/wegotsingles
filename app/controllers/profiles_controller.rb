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
    @results = []
    Profile.all.each do |profile|
      if (@profile.distance_to(profile.postcode) <= params[:distance].to_f) && (profile != @profile)
        @results << [profile, @profile.distance_to(profile.postcode).round(2)]
      end
    end
    @results.sort!{|a, b| a[1] <=> b[1]}
  end

  private

  def profile_params
    params.require(:profile).permit(:biography, :drinks)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end

