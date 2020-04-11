class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
  
  private
  def post_params
    params.require(:post).permit(:temperature, :weather, :driving_status, :driving_mode, :distance, :consumption, :text, :date, :start_time, :end_time).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? 
  end
end
