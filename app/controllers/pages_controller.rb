class PagesController < ApplicationController
  def home
    @places = Place.all
  end

  def profile
    @user = current_user
    redirect_to root_path unless @user
  end
end
