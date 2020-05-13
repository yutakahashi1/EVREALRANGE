class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :ensure_correct_user, except: [:show]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
    @userposts = @user.posts
    @projected_ranges = []
    @postdates = []
    @userposts.each do |post|
      projected_range = (post.distance.to_f/post.consumption.to_f*100).round(1) rescue 0
      @projected_ranges << projected_range 
      @postdate = post.date
      @postdates << @postdate
    end
    @usercarEPA = []
    usercar = @user.car.EPA_range
    tickInterval = 1
    average_range = (@projected_ranges.sum / @projected_ranges.length).round(1) rescue 0
    @average_ranges = []
    @userposts.count.times do
      @usercarEPA << usercar
      @average_ranges << average_range
    end
    @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "#{@user.nickname}'s Projected Range Data")
      f.xAxis(categories: @postdates, tickInterval: tickInterval, class: "graph_xAxis")
      f.series(name: "#{@user.nickname}'s Projected Range", data: @projected_ranges, type: 'spline')
      f.series(name: "#{@user.nickname}'s Average Range", data: @average_ranges, type: 'line')
      f.series(name: "#{@user.car.car_type}'s EPA Range", data: @usercarEPA, type: 'line')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to root_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image)
  end

  def ensure_correct_user
    user = User.find_by(id: params[:id])
    if user.id != current_user.id
      redirect_to root_path
    end
  end
end
