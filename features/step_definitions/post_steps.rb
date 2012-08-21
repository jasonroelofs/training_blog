Given /^the blog "(.*?)" has the following posts$/ do |blog_title, table|
  blog = BlogRepository.find_by_title(blog_title)

  table.hashes.each do |row|
    post = Post.new :blog => blog,
      :title => row[:title],
      :body => row[:body]

    PostRepository.save post
  end
end
