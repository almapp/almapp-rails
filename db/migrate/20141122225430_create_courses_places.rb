class CreateCoursesPlaces < ActiveRecord::Migration
  def change
    create_table :courses_places, id: false do |t|
      t.belongs_to :course, null: false
      t.belongs_to :place, null: false
      t.integer :year
      t.integer :semester

      t.timestamps
    end
  end
end
