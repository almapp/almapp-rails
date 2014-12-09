class CreateTeachersSections < ActiveRecord::Migration
  def change
    create_table :teachers_sections, id: false do |t|
      t.belongs_to :teacher, null: false
      t.belongs_to :section, null: false
      t.integer :year
      t.integer :semester

      t.timestamps
    end
  end
end
