class DestroyPosts < ActiveRecord::Migration
  def change
    drop_table :posts
  end
end
