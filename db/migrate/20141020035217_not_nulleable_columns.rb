class NotNulleableColumns < ActiveRecord::Migration
  def change
    change_column :organizations, :name, :string, :null => false

    rename_column :organizations, :info, :information
    add_column :organizations, :facebook, :string
    add_column :organizations, :twitter, :string

  end
end
