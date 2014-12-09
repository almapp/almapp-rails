class ChangeDescriptionType < ActiveRecord::Migration
  def change
    change_column :faculties, :description, :text
    change_column :camps, :description, :text

  end
end
