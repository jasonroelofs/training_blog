require 'test_helper'

describe Post do
  it "takes attributes in constructor" do
    blog = Blog.new
    p = Post.new :blog => blog, :title => "Johnson", :body => "Rockin"

    p.blog.must_equal blog
    p.title.must_equal "Johnson"
    p.body.must_equal "Rockin"
  end

  it "requires title for validation" do
    p = Post.new :body => "Wha?!"
    assert !p.valid?

    p.title = "OH yeah"
    assert p.valid?
  end

  it "requires body for validation" do
    p = Post.new :title => "Wha?!"
    assert !p.valid?

    p.body = "OH yeah"
    assert p.valid?
  end
end
