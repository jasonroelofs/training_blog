BlogRepository = InMemory::BlogRepo.new
PostRepository = InMemory::PostRepo.new

if Rails.env.development?
  BlogRepository.save Blog.new("My Test Blog")
  BlogRepository.save Blog.new("Rants and Raves")
end
