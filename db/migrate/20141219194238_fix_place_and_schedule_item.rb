class FixPlaceAndScheduleItem < ActiveRecord::Migration
  def change
    remove_column :schedule_items, :place_id
    rename_column :schedule_items, :alt_place, :place_name

    remove_index :places, :slug
    add_index :places, [:slug, :camp_id], :unique => true
  end
end
