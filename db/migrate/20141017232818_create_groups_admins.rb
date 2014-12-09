class CreateGroupsAdmins < ActiveRecord::Migration
  def change
    create_table :groups_admins do |t|
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
