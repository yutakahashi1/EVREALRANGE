class CarmakersController < ApplicationController
  def index
    @carmakers = Carmaker.all
    
  end

  def show
    @carmaker = Carmaker.find(params[:id])
    @cars = @carmaker.cars
    @users = @carmaker.users
  end
end
