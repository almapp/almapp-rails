class ChangeCoordsForLongitudeLatitude < ActiveRecord::Migration
  def change
    remove_column :camps, :coords
    add_column :camps, :latitude, :float, default: 0.0
    add_column :camps, :longitude, :float, default: 0.0

    remove_column :faculties, :coords
    add_column :faculties, :latitude, :float, default: 0.0
    add_column :faculties, :longitude, :float, default: 0.0

    remove_column :places, :coords
    add_column :places, :latitude, :float, default: 0.0
    add_column :places, :longitude, :float, default: 0.0
  end
end
