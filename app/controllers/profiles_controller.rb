class ProfilesController < ApplicationController
  before_action :set_profile, :only => [:update, :show, :edit]

  def create
    binding.pry
  end

  def update
    @profile.update(profile_params)

    if @profile.save
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
    params.require(:profile).permit(:biography, :drinks, :weight, :desires, :postcode, :name, :gender, :latitude, :longitude)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end

