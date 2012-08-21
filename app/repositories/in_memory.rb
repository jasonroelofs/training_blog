module InMemory

  class Repo
    def initialize
      reset!
    end

    def reset!
      @id_counter = 1
      @objects = []
    end

    def find(id)
      @objects.find {|o| o.id == id.to_i }
    end

    def all
      @objects
    end

    def save(object)
      if object.valid?
        object.id ||= (@id_counter += 1)
        @objects << object
        true
      else
        false
      end
    end
  end

  class BlogRepo < Repo
    def find_by_title(title)
      all.find {|b| b.title == title }
    end
  end

  class PostRepo < Repo
    def find_all_in_blog(blog)
      all.select {|post| post.blog == blog }
    end
  end

end
