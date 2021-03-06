require 'test_helper'

describe BlogsController do

  before do
    @blog1 = Blog.new :title => "Blog of Johnson"
    @blog2 = Blog.new :title => "Eating Pie"

    BlogRepository.save @blog1
    BlogRepository.save @blog2
  end

  describe "#index" do
    it "finds all known blogs in the system" do
      get :index

      assigns(:blogs).must_equal [@blog1, @blog2]
    end
  end

  describe "#show" do
    it "finds the selected blog and shows it" do
      get :show, :id => @blog1.id

      assigns(:blog).must_equal @blog1
      assigns(:posts).must_equal []
    end

    it "finds the blog's posts and puts them up too" do
      post1 = Post.new :blog => @blog1,
        :title => "This is a new cool Post",
        :body => "OMG I am SO COOL"

      post2 = Post.new :blog => @blog2,
        :title => "This is a new cool Post",
        :body => "OMG I am SO COOL"

      PostRepository.save post1
      PostRepository.save post2

      get :show, :id => @blog1.id

      assigns(:posts).must_equal [post1]
    end
  end

  describe "#new" do
    it "renders the new blog form" do
      get :new

      assigns(:blog).wont_be_nil
    end
  end

  describe "#create" do
    it "build and saves a new blog" do
      post :create, :blog => {:title => "Minecraft Tips"}

      new_blog = BlogRepository.all.find {|b| b.title == "Minecraft Tips"}
      new_blog.wont_be_nil
    end

    it "doesn't create the blog if no title given" do
      post :create, :blog => {:title => ""}

      new_blog = BlogRepository.all.find {|b| b.title == ""}
      new_blog.must_be_nil
    end
  end
end

