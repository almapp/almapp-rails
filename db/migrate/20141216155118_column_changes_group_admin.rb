class ColumnChangesGroupAdmin < ActiveRecord::Migration
  def change
    change_column :groups_admins, :user_id, :integer, index: true, null: false
    change_column :groups_admins, :group_id, :integer, index: true, null: false
    change_column :groups_admins, :appointment, :string, default: '', null: false
  end
end
