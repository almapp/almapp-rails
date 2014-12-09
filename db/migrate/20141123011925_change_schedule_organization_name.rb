class ChangeScheduleOrganizationName < ActiveRecord::Migration
  def change
    rename_table :schedule_modules_sections, :schedule_items
  end
end
