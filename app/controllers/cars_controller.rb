class CarsController < ApplicationController
  def index
    @cars = Car.all
    @user_data= User.where(payment_result: 1).group("date(created_at)").count

  end
  
  def show
    @car = Car.find(params[:id])
    @posts = @car.posts
  
  end
end
