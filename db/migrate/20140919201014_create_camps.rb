class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.string :cid, :null => false, :unique => true
      t.string :name, :null => false, :unique => true
      t.references :organization, index: true, :null => false
      t.string :address
      t.string :url
      t.string :description
      t.string :coords
      t.string :icon
      t.integer :zoom
      t.integer :angle
      t.integer :tilt

      t.timestamps
    end
  end
end
