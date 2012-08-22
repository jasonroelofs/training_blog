class Blog
  include Entity

  attr_accessor :title

  validates_presence_of :title

  def self.find(id)
    BlogRepository.find id
  end

  def self.all
    BlogRepository.all
  end

  def save
    BlogRepository.save self
  end

  def posts
    PostRepository.find_all_in_blog self
  end

end
