class ScheduleCreation < ActiveRecord::Migration
  def change
    add_reference :schedule_modules_sections, :place, index: true
    add_column :schedule_modules_sections, :class_type, :string
  end
end
