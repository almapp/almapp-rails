class ChangeSemesterArchitecture < ActiveRecord::Migration
  def change
    add_column :sections, :semester, :integer, null: false
    add_column :sections, :year, :integer, null: false

    remove_column :schedule_items, :semester
    remove_column :schedule_items, :year

    remove_column :assistantships, :semester
    remove_column :assistantships, :year

  end
end
