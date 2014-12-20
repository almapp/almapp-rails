class RemoveNotNullScheduleItem < ActiveRecord::Migration
  def change
    change_column_null :schedule_items, :section_id, true
  end
end
