module InMemory
  class BlogRepo

    def initialize
      self.reset!
    end

    def reset!
      @id_counter = 1
      @blogs = []
    end

    def all
      @blogs
    end

    def find(id)
      @blogs.find {|b| b.id == id }
    end

    def save(blog)
      if blog.valid?
        blog.id ||= (@id_counter += 1)
        @blogs << blog
        true
      else
        false
      end
    end

  end
end
