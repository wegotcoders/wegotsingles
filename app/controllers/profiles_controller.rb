class ProfilesController < ApplicationController
  
  def show
  end

  def search
    @results=Profile.where(gender: params[:gender])
    render :search
  end

end
