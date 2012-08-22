class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find params[:id]
    @posts = @blog.posts
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new params[:blog]

    if @blog.save
      redirect_to blogs_path
    else
      render "new"
    end
  end

end
