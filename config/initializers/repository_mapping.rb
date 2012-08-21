BlogRepository = InMemory::BlogRepo.new
PostRepository = InMemory::PostRepo.new

if Rails.env.development?
  BlogRepository.save Blog.new(:title => "My Test Blog")
  BlogRepository.save Blog.new(:title => "Rants and Raves")
end
