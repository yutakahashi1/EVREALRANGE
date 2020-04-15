class CarsController < ApplicationController
  def index
    @cars = Car.all
  end
  
  def show
    @car = Car.find(params[:id])
    @posts = @car.posts
    @projected_ranges = []
    @posts.each do |post|
      @projected_range = (post.distance.to_f/post.consumption.to_f*100).round(1)
      @projected_ranges << @projected_range 
    end
    @average_range = @projected_ranges.sum / @projected_ranges.length
    @average_ranges = []
    @average_ranges << @average_range
    @average_ranges << @average_range
    
    tickInterval = 1
    date = Post.pluck(:date)
    @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Projected Range')
      f.xAxis(categories: date, tickInterval: tickInterval)
      f.series(name: 'Name', data: @projected_ranges, type: 'scatter')
      f.series(name: 'Name', data: @average_ranges, type: 'line')
    end
  end
end
