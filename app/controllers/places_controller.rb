class PlacesController < ApplicationController
  def index
    @places = Place.all.page(params[:page]).per(5)
  end
 
  def new
    @place = Place.new
  end
  
  def create
    Place.create(place_params)
    redirect_to root_path
  end 

  def about
  end

  def search
    @places = Place.all
    if params[:search]
      @places = Place.search(params[search]).order("created_at DESC")
    else
      @places = Place.all.order("created_at DESC")
    end

  end

  private

  def place_params
    params.require(:place) .permit(:name, :description, :address)
  end


end 