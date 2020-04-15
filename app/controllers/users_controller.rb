class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
    @postusers = @user.posts
    @projected_ranges = []
    @postusers.each do |post|
      @projected_range = (post.distance.to_f/post.consumption.to_f*100).round(1)
      @projected_ranges << @projected_range 
      
    end
    tickInterval = 1
    @average_range = (@projected_ranges.sum / @projected_ranges.length).round(1)
    @average_ranges = []
    @average_ranges << @average_range
    @average_ranges << @average_range
    @average_ranges << @average_range
    @average_ranges << @average_range
    @average_ranges << @average_range
    @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: '航続可能距離　いけたら日付をX軸')
      f.xAxis(categories: "", tickInterval: tickInterval)
      f.series(name: "#{@user.nickname}'s Projected Range", data: @projected_ranges, type: 'spline')
      f.series(name: "#{@user.nickname}'s Average Range", data: @average_ranges, type: 'line')
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

end
