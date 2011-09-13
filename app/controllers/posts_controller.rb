require 'kramdown'
require 'rinku'

class PostsController < ApplicationController
  helper_method :post

  def index
    @posts = Post.order(:created_at).page params[:page]
  end

  def create
    if post.save
      redirect_to posts_url(:page => params[:page])
    else
      index
    end
  end

  def update
    if post.update_attributes params[:post]
      redirect_to posts_url(:page => params[:page])
    else
      index
    end
  end

  private

  def post
    @post = if params[:id]
      Post.find params[:id]
    else
      current_user.posts.new params[:post]
    end
  end
end
