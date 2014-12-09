class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :fid, :null => false
      t.string :name, :null => false
      t.references :camp, index: true
      t.string :address
      t.string :url
      t.string :description
      t.string :coords
      t.string :icon
      t.integer :zoom, :default => 0
      t.integer :angle, :default => 0
      t.integer :tilt, :default => 0

      t.timestamps
    end
    add_index :faculties, :fid, unique: true
    add_index :faculties, :name
  end
end
