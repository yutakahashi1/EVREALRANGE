class CarsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index_except_admin, except: [:index, :show]
  def index
    @cars = Car.includes(:posts)
  end
  
  def show
    @car = Car.find(params[:id])
    @carposts = @car.posts
    @posts = @car.posts.order("posts.created_at desc")&.page(params[:page]).per(5)
    @projected_ranges = []
    @postdates = []
    @carposts.each do |post|
      @projected_range = (post.distance.to_f/post.consumption.to_f*100).round(1) rescue 0
      @projected_ranges << @projected_range 
      postdate = post.date
      @postdates << postdate
    end
    @average_range = (@projected_ranges.sum / @projected_ranges.length).round(1) rescue 0
    @average_ranges = []
    @EPA_ranges = []
    @carposts.count.times do
      @average_ranges << @average_range
      @EPA_ranges << @car.EPA_range
    end
    tickInterval = 1
    date = Post.pluck(:date)
    @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "#{@car.car_type}'s Projected Range")
      f.xAxis(categories: @postdates, tickInterval: tickInterval)
      f.series(name: "#{@car.car_type}'s users' projected range", data: @projected_ranges, type: 'scatter')
      f.series(name: "#{@car.car_type}'s average range", data: @average_ranges, type: 'line')
      f.series(name: "#{@car.car_type}'s EPA range", data: @EPA_ranges, type: 'line')
    end
  end

  def new
    @car = Car.new 
    
  end

  def create
    car = Car.create(car_params)
    redirect_to root_path
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    car.update(car_params)
    redirect_to car_path(car)
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to root_path
  end

  private
  def car_params
    params.require(:car).permit(:car_type, :image, :WLTP_range, :EPA_range, :carmaker_id, :electric_energy)
  end

  def move_to_index_except_admin
    redirect_to action: :index unless current_user.admin?
  end

end
