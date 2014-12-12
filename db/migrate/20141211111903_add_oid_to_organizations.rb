class AddOidToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :slug, :string, null: false, unique: true
  end
end
