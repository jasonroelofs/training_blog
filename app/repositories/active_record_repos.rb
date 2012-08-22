module ActiveRecordRepos

  class Blog < ActiveRecord::Base

    def self.from_model(blog)
      where(:id => blog.id).first_or_initialize.tap do |obj|
        obj.title = blog.title
      end
    end

  end

  class Post < ActiveRecord::Base
    belongs_to :blog

    def self.from_model(post)
      where(:id => post.id).first_or_initialize.tap do |obj|
        obj.title = post.title
        obj.body = post.body
        obj.blog = Blog.from_model(post.blog)
      end
    end

  end

  class BlogRepo

    def save(blog)
      return false unless blog.valid?

      ar_blog = Blog.from_model(blog)
      ar_blog.save
      true
    end

    def find(id)
      convert_to_model Blog.find(id)
    end

    def find_by_title(title)
      convert_to_model Blog.where(:title => title).first
    end

    def all
      convert_all_to_model Blog.all
    end

    def reset!
      Blog.destroy_all
    end

    def convert_all_to_model(ar_blogs)
      ar_blogs.map do |ar_blog|
        convert_to_model ar_blog
      end
    end

    def convert_to_model(ar_blog)
      ::Blog.new :id => ar_blog.id, :title => ar_blog.title
    end
  end

  class PostRepo

    def save(post)
      return false unless post.valid?

      ar_post = Post.from_model(post)
      ar_post.save
      true
    end

    def find(id)
      convert_to_model Post.find(id)
    end

    def find_all_in_blog(blog)
      convert_all_to_model Post.where(:blog_id => blog.id).all
    end

    def all
      convert_all_to_model Post.all
    end

    def reset!
      Post.destroy_all
    end

    def convert_all_to_model(ar_posts)
      ar_posts.map do |ar_post|
        convert_to_model ar_post
      end
    end

    def convert_to_model(ar_post)
      ::Post.new :id => ar_post.id, :title => ar_post.title,
        :body => ar_post.body,
        :blog => ar_post.blog
    end

  end
end
