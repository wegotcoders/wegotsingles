class ProfilesController < ApplicationController
  
  def show
  end

  def search
    binding.pry
    @results=Profile.where(gender: params[:gender])
    render :search
  end

end
