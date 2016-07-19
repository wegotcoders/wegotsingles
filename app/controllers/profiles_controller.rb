class ProfilesController < ApplicationController

  before_action :set_profile,  except: [:new, :create, :index]

  def index
    
  end

  def new
    
  end

  def edit
    
  end

  def create

  end

  def update
    
  end

  def show
    
  end

  def delete

  end

  private

  def profile_params
    params.require(:profile).permit(:biography)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
