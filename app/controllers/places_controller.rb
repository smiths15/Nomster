class PlacesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]  

  def index
    @places = Place.all.page(params[:page]).per(5)
  end
 
  def new
    @place = Place.new
  end
  
  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end 
 
  def about
  end

  def search
    if params[:search].blank? 
      flash[:error] = "Please make a valid entry"
      else 
      @places = Place.search(params[:search]).page(params[:page]).per(5)
      render :index 
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render text: 'Not allowed', layout: true, status: :forbidden 
    end
  end

  def update
    @place = Place.find(params[:id])
    
    if @place.user != current_user
      return render text: 'Not allowed', layout: true, status: :forbidden 
    end

    @place.update_attributes(place_params)
    redirect_to root_path
  end

def destroy
  @place = Place.find(params[:id])
  
  if @place.user != current_user
    return render text: 'Not allowed', layout: true, status: :forbidden 
  end

  @place.destroy
  redirect_to root_path
end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end


end 