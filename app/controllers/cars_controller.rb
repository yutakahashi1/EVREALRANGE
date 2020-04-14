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

    userid = Car.joins(:users).pluck(:nickname)
    tickInterval = 1
    post = Post.pluck(:distance)
    
    @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Projected Range')
      f.xAxis(categories: "", tickInterval: tickInterval)
      f.series(name: 'Name', data: @projected_ranges, type: 'scatter')
    end
  
  end
end
