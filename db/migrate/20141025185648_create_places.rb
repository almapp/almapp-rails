class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :pid, :null => false
      t.string :name
      t.references :faculty, index: true
      t.string :coords
      t.string :floor
      t.string :icon
      t.text :description
      t.float :zoom, :default => 0.0
      t.float :angle, :default => 0.0
      t.float :tilt, :default => 0.0

      t.timestamps
    end

    add_index :places, :pid, unique: true
  end
end
