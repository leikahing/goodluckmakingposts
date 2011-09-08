require 'kramdown'
require 'rinku'

class PostsController < ApplicationController
  helper_method :post

  def index
    @posts = Post.order(:created_at).page params[:page]
  end

  def create
    post.user = current_user
    if post.save
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
      Post.new(params[:post]).tap {|p| p.user = current_user}
    end
  end
end
