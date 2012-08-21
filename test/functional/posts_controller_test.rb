require 'test_helper'

describe PostsController do

  before do
    @blog = Blog.new :title => "My Blog"
    BlogRepository.save @blog
  end

  describe "#new" do
    it 'renders the new post form for the given blog' do
      get :new, :blog_id => @blog.id

      assigns(:blog).must_equal @blog
      assigns(:post).wont_be_nil
    end
  end

  describe "#create" do
    it "creates a new post" do
      post :create, :blog_id => @blog.id,
        :post => {:title => "Something Cool", :body => "Something Bad"}

      posts = PostRepository.find_all_in_blog(@blog)
      posts.length.must_equal 1

      posts[0].title.must_equal "Something Cool"
      posts[0].body.must_equal "Something Bad"
    end
  end
end
