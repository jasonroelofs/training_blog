class CreateBlogsTable < ActiveRecord::Migration
  def up
    create_table :blogs do |t|
      t.string :title
    end
  end

  def down
    drop_table :blogs
  end
end
