class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships, id: false do |t|
      t.references :user, index: true, null: false
      t.references :friend, index: true, null: false
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
