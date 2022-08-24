class PagesController < ApplicationController
  def home
    @places = Place.all
  end

  def profile
    @user = current_user
  end
end
