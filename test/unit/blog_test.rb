require 'test_helper'

describe Blog do
  it "takes a title in constructor" do
    blog = Blog.new :title => "title"
    blog.title.must_equal "title"
  end

  it "can be given no title" do
    blog = Blog.new
    blog.title.must_be_nil
  end

  it "requires a title to be valid" do
    blog = Blog.new
    assert !blog.valid?

    blog.title = ""
    assert !blog.valid?

    blog.title = "A new title!"
    assert blog.valid?
  end

  it "has an id" do
    blog = Blog.new :title => "title"
    blog.id.must_be_nil

    blog.id = 10
    blog.id.must_equal 10
  end
end
