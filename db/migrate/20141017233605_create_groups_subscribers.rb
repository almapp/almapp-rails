class CreateGroupsSubscribers < ActiveRecord::Migration
  def change
    create_table :groups_subscribers do |t|
      t.references :user, index: true
      t.references :group, index: true
      t.boolean :visible_mail, default: false
      t.boolean :notifications, default: false

      t.timestamps
    end
  end
end
