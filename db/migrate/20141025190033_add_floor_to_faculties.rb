class AddFloorToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :floor, :string
  end
end
