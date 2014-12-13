class AddUsernameToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :username, :string, null: false
    change_column :users, :username, :string, null: false
  end
end
