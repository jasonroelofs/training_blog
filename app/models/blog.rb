class Blog
  include Entity

  attr_accessor :title

  validates_presence_of :title

end
