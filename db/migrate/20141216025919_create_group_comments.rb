class CreateGroupComments < ActiveRecord::Migration
  def change
    create_table :group_comments do |t|
      t.references :user, index: true, null: false
      t.references :group, index: true, null: false
      t.text :comment, default: '', null: false

      t.timestamps
    end
  end
end
