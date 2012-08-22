module ActiveRecordRepos

  class Blog < ActiveRecord::Base

    def self.from_domain(blog)
      where(:id => blog.id).first_or_initialize.tap do |obj|
        obj.title = blog.title
      end
    end

  end

  class Post < ActiveRecord::Base
    belongs_to :blog

    def self.from_domain(post)
      where(:id => post.id).first_or_initialize.tap do |obj|
        obj.title = post.title
        obj.body = post.body
        obj.blog = Blog.from_domain(post.blog)
      end
    end

  end

  class ArRepo

    attr_reader :ar_model_class
    attr_reader :domain_model_class

    def initialize(ar_model_class, domain_model_class)
      @ar_model_class = ar_model_class
      @domain_model_class = domain_model_class
    end

    ##
    # Persist the domain object. This object must be an
    # ActiveModel and it must have Validations on it. If the
    # model is valid it will be saved, otherwise it won't.
    #
    # Returns true / false accordingly
    ##
    def save(domain_object)
      return false unless domain_object.valid?

      @ar_model_class.from_domain(domain_object).save
      true
    end

    ##
    # Find the model with the given id.
    # Will return an instance of the appropriate domain_model_class
    ##
    def find(id)
      convert_to_domain_object @ar_model_class.find(id)
    end

    ##
    # Return all known rows of this model.
    # Will return instances of the appropriate domain_model_class
    ##
    def all
      convert_all_to_domain_object @ar_model_class.all
    end

    ##
    # Clear out all known rows of this model.
    ##
    def reset!
      @ar_model_class.destroy_all
    end

    protected

    def convert_all_to_domain_object(ar_objects)
      ar_objects.map do |ar_object|
        convert_to_domain_object ar_object
      end
    end

    def convert_to_domain_object(ar_object)
      raise "Must implement how to convert from AR to Domain models"
    end

  end

  class BlogRepo < ArRepo

    def initialize
      super(Blog, ::Blog)
    end

    def find_by_title(title)
      convert_to_domain_object @ar_model_class.where(:title => title).first
    end

    def convert_to_domain_object(ar_blog)
      domain_model_class.new :id => ar_blog.id, :title => ar_blog.title
    end
  end

  class PostRepo < ArRepo

    def initialize
      super(Post, ::Post)
    end

    def find_all_in_blog(blog)
      convert_all_to_domain_object @ar_model_class.where(:blog_id => blog.id).all
    end

    def convert_to_domain_object(ar_post)
      domain_model_class.new :id => ar_post.id,
        :title => ar_post.title,
        :body => ar_post.body,
        :blog => ar_post.blog
    end

  end
end
