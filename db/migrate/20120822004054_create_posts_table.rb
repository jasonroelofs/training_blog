class CreatePostsTable < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.integer :blog_id
      t.string :title
      t.string :body
    end
  end

  def down
    drop_table :posts
  end
end
