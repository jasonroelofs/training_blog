class PostsController < ApplicationController

  def new
    @blog = BlogRepository.find params[:blog_id]
    @post = Post.new
  end

  def create
    @blog = BlogRepository.find params[:blog_id]
    @post = Post.new params[:post]
    @post.blog = @blog

    if PostRepository.save @post
      redirect_to blog_path(@blog)
    else
      render "new"
    end
  end

end
