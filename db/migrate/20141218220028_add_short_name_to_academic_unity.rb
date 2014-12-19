class AddShortNameToAcademicUnity < ActiveRecord::Migration
  def change
    add_column :academic_unities, :short_name, :string, null: false
  end
end
