require 'test_helper'

describe Post do
  it "takes attributes in constructor" do
    blog = Blog.new
    p = Post.new :blog => blog, :title => "Johnson", :body => "Rockin"

    p.blog.must_equal blog
    p.title.must_equal "Johnson"
    p.body.must_equal "Rockin"
  end
end
