class CreateScheduleModules < ActiveRecord::Migration
  def change
    create_table :schedule_modules do |t|
      t.string :initials, null: false
      t.integer :day, null: false
      t.integer :block, null: false
      t.string :start_time, null: false
      t.string :end_time, null: false

    end
    add_index :schedule_modules, :initials, unique: true
  end
end
