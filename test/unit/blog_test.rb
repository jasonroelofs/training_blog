require 'test_helper'

describe Blog do
  it "takes a title in constructor" do
    blog = Blog.new "title"
    blog.title.must_equal "title"
  end

  it "can be given no title" do
    blog = Blog.new
    blog.title.must_be_nil
  end

  it "has an id" do
    blog = Blog.new "title"
    blog.id.must_be_nil

    blog.id = 10
    blog.id.must_equal 10
  end
end
