class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_correct_user, except: [:index, :show, :new, :create]
  
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
    
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
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
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
  
  private
  def post_params
    params.require(:post).permit(:temperature, :weather, :AC, :AC_temperature, :driving_status, :driving_mode, :distance, :consumption, :text, :date, :start_time, :end_time, :car_id, :carmaker_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path
  end

  def ensure_correct_user
    post = Post.find_by(id: params[:id])
    if post.user_id != current_user.id
      redirect_to root_path
    end
  end
end
