class PostsController < ApplicationController

  def new
    @blog = Blog.find params[:blog_id]
    @post = Post.new
  end

  def create
    @blog = Blog.find params[:blog_id]
    @post = Post.new params[:post]
    @post.blog = @blog

    if @post.save
      redirect_to blog_path(@blog)
    else
      render "new"
    end
  end

end
