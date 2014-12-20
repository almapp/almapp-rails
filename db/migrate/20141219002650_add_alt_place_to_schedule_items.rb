class AddAltPlaceToScheduleItems < ActiveRecord::Migration
  def change
    add_column :schedule_items, :alt_place, :string
  end
end
