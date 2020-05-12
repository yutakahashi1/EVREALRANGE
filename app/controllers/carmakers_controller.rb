class CarmakersController < ApplicationController
  def index
    @carmakers = Carmaker.includes(:cars)
  end

  def show
    @carmaker = Carmaker.find(params[:id])
    @cars = @carmaker.cars
    @post = []
    @cars.each do |car|
      @post << car.posts.first
    end
  
  end

  def new
    @carmaker = Carmaker.new
  end

  def create
    carmaker = Carmaker.create(carmaker_params)
    redirect_to carmaker_path(carmaker)
  end

  def edit
    @carmaker = Carmaker.find(params[:id])
  end

  def update
    carmaker = Carmaker.find(params[:id])
    carmaker.update(carmaker_params)
    redirect_to carmaker_path(carmaker)
  end

  def destroy
    carmaker = Carmaker.find(params[:id])
    carmaker.destroy
    redirect_to root_path
  end

  private
  def carmaker_params
    params.require(:carmaker).permit(:maker, :image, :explanation)
  end
end
