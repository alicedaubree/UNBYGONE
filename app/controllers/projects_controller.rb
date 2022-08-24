class ProjectsController < ApplicationController
  before_action :set_place, only: %i[new create destroy]

  def new
    @project = Project.new
    @placeholder = "Je souhaiterais proposer un projet pour le lieu suivant : \n- #{@place.title}\n\nqui est disponible pour un projet:\n-#{@place.available_for}\n"
  end

  # def search
  #   @movie = Movie.find(title: params[:query])
  # end

  def create
    @project = Project.new(project_params)
    @project.place = @place
    @project.user = current_user
    if @project.save!
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to place_path(@place), status: :see_other
  end

  private

  def project_params
    params.require(:project).permit(:details, :start_date, :end_date, :accepted, :user_id, :place_id)
  end

  def set_place
    @place = Place.find(params[:place_id])
  end
end
