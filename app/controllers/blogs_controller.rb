class BlogsController < ApplicationController

  def index
    @blogs = BlogRepository.all
  end

  def show
    @blog = BlogRepository.find params[:id].to_i
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new params[:blog][:title]
    BlogRepository.save @blog
    redirect_to blogs_path
  end

end
