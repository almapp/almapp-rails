class AddGmapsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :gmaps, :boolean, default: true
  end
end
