class PlacesController < ApplicationController

  before_action :set_place, only: [:show, :edit, :update, :destroy]



  def index
    @places = Place.all
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window: render_to_string(partial: "info_window", locals: {place: place})
      }
    end

  end

  def new
    @place = Place.new
    @placeholder = "Description du lieu :\n\n\n\n\nCe lieu est disponible à la location pour les évènements suivants :\n\n\n\n\nNous sommes intéressés par les projets d'aménagement suivants :\n\n\n\n\n"
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

  def edit
  end

  def update
    @place.update(place_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to place_path(@place)
  end

  def destroy
    @place.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to root_path, status: :see_other
  end

  private

  def place_params
    params.require(:place).permit(:title, :description, :available_for, :type_of_place, photos: [])
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
