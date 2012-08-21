class Post
  include Entity

  attr_accessor :title, :body, :blog

  validates_presence_of :title
  validates_presence_of :body

end
