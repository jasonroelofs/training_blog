class BlogsController < ApplicationController

  def index
    @blogs = BlogRepository.all
  end

  def show
    @blog = BlogRepository.find params[:id].to_i
  end

end
