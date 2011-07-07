class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]
    @post.user = current_user
    if @post.save
      redirect_to posts_url, :notice => "Post created."
    else
      render :new
    end
  end
end
