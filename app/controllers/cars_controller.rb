class CarsController < ApplicationController
  def index
    @cars = Car.all
  end
  
  def show
    @car = Car.find(params[:id])
    @postcars = @car.posts
    @posts = @car.posts.page(params[:page]).per(5)
    @projected_ranges = []
    @postcars.each do |post|
      @projected_range = (post.distance.to_f/post.consumption.to_f*100).round(1) rescue 0
      @projected_ranges << @projected_range 
    end
    @average_range = (@projected_ranges.sum / @projected_ranges.length).round(1) rescue 0
    @average_ranges = []
    @average_ranges << @average_range
    @average_ranges << @average_range
    @EPA_ranges = []
    @EPA_ranges << @car.EPA_range
    @EPA_ranges << @car.EPA_range

    
    tickInterval = 1
    date = Post.pluck(:date)
    @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "#{@car.car_type}'s Projected Range")
      f.xAxis(categories: "", tickInterval: tickInterval)
      f.series(name: "#{@car.car_type}'s users' projected range", data: @projected_ranges, type: 'scatter')
      f.series(name: "#{@car.car_type}'s average range", data: @average_ranges, type: 'line')
      f.series(name: "#{@car.car_type}'s EPA range", data: @EPA_ranges, type: 'line')
    end
  end
end
