class ChangeTablesNamesHabtmFix < ActiveRecord::Migration
  def change
    rename_table :teachers_sections, :sections_teachers
    rename_table :users_sections, :sections_users
  end
end
