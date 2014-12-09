class DeleteCoursesPlaces < ActiveRecord::Migration
  def change
    drop_table :courses_places
  end
end
