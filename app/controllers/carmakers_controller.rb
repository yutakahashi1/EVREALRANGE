class CarmakersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index_except_admin, except: [:index, :show]
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
    redirect_to carmakers_path
  end

  def edit
    @carmaker = Carmaker.find(params[:id])
  end

  def update
    carmaker = Carmaker.find(params[:id])
    carmaker.update(carmaker_params)
    redirect_to carmakers_path
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

  def move_to_index_except_admin
    redirect_to action: :index unless current_user.admin?
  end
end
