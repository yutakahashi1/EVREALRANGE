class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    


      userid = User.find_by(nickname: params[:nickname])
      tickInterval = 1
      postcar = Post.where("car_id = 1").pluck(:distance)
      
      
      @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(text: '航続可能距離　いけたら日付をX軸')
        f.xAxis(categories: "#", tickInterval: tickInterval)
        f.series(name: 'データの名前', data: postcar, type: 'line')
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
    params.require(:user).permit(:nickname, :email)
  end

end
