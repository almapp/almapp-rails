class CreateModuleSection < ActiveRecord::Migration
  def change
    create_table :schedule_modules_sections, id: false do |t|
      t.belongs_to :schedule_module, null: false
      t.belongs_to :section, null: false
      t.integer :year
      t.integer :semester

      t.timestamps
    end
  end
end
