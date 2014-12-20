class RemakeScheduleItem < ActiveRecord::Migration
  def change
    drop_table :schedule_items
    create_table :schedule_items do |t|
      t.references :schedule_module, index: true
      t.references :section, index: true
      t.references :place, index: true
      t.string :alt_place
      t.string :class_type
    end
  end
end
