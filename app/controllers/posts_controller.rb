class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post is ok !"
      redirect_to posts_path
    else
      flash[:alert] = "Post is not ok !!!"
      render "new"
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notcie] = "Post ok change !"
      redirect_to posts_path
    else
      flash[:alert] = "Post isn't change !!!"
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:alert] = "Post is delete !!!!!"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
