BlogRepository = InMemory::BlogRepo.new

BlogRepository.save Blog.new("My Test Blog")
BlogRepository.save Blog.new("Rants and Raves")
