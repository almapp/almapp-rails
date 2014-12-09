class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.references :user, index: true
      t.string :kind

      t.timestamps
    end
  end
end
