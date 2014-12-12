class AddShortNameToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :short_name, :string, null: false
  end
end
