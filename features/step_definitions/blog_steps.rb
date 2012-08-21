Given /^there are the following blogs:$/ do |table|
  table.hashes.each do |row|
    blog = Blog.new :title => row[:title]
    BlogRepository.save(blog)
  end
end
