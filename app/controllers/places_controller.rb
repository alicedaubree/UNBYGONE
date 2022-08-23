class PlacesController < ApplicationController

  before_action :set_place, only: :show

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.valid?
      @place.save
      redirect_to places_path(@place)
    else
      render :new
    end
  end

  def show
  end


  private

  def place_params
    params.require(:place).permit(:title, :description, :available_for, :type_of_place, photos: [])
  end

  def set_place
    @place = Place.find(params[:id])
  end


end
