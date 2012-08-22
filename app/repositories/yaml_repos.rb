module YamlRepos

  class YamlRepo < InMemory::Repo

    def initialize(table_name)
      super()

      @root_dir = Rails.root.join("db", "yaml")
      @objects_file = @root_dir.join("#{table_name}.yml")

      FileUtils.mkdir_p @root_dir

      begin
        @objects = load_objects_from_hashes(YAML.load_file(@objects_file))
      rescue => ex
        Rails.logger.info ex.inspect
        @objects = []
      end
    end

    def reset!
      super
      dump_objects_to_yaml
    end

    def save(obj)
      super(obj).tap do
        dump_objects_to_yaml
      end
    end

    protected

    def dump_objects_to_yaml
      return unless @objects_file
      File.open(@objects_file, "w") do |f|
        f.write YAML.dump(hashify_objects(@objects))
      end
    end

    def hashify_objects(objects)
      objects.map do |obj|
        convert_object_to_hash(obj)
      end
    end

    def load_objects_from_hashes(hashes)
      hashes.map do |hash|
        convert_hash_to_object(hash)
      end
    end

  end

  class BlogRepo < YamlRepo
    def initialize
      super("blogs")
    end

    def find_by_title(title)
      all.find {|b| b.title == title }
    end

    def convert_object_to_hash(object)
      {:id => object.id, :title => object.title}
    end

    def convert_hash_to_object(hash)
      Blog.new hash
    end
  end

  class PostRepo < YamlRepo
    def initialize
      super("posts")
    end

    def find_all_in_blog(blog)
      all.select {|post| post.blog.id == blog.id }
    end

    def convert_object_to_hash(object)
      {:id => object.id, :title => object.title, :body => object.body, :blog_id => object.blog.id}
    end

    def convert_hash_to_object(hash)
      Post.new :id => hash[:id],
        :title => hash[:title],
        :body => hash[:body],
        :blog => BlogRepository.find(hash[:blog_id])
    end
  end
end
