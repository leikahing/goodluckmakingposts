require 'kramdown'

class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    post = Post.new( params[:post] )
    post.user = current_user
    if post.save
      redirect_to posts_url, :notice => "Post created."
    else
      index
    end
  end
end
