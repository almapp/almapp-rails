class AddCampNameToScheduleItems < ActiveRecord::Migration
  def change
    add_column :schedule_items, :camp_name, :string
  end
end
