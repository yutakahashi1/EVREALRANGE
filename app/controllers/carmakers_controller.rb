class CarmakersController < ApplicationController
  def index
    @carmakers = Carmaker.all
    @carmakers.each do |carmaker|
      @car = carmaker.cars.last
      #@latest_car = @cars.order(created_at: :asc).first
    end
    

  end

  def show
    @carmaker = Carmaker.find(params[:id])
    @cars = @carmaker.cars
    @users = @carmaker.users
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
