class ChangeDescriptionTypeInfoGroups < ActiveRecord::Migration
  def change
    change_column :groups, :information, :text
  end
end
