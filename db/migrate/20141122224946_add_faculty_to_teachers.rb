class AddFacultyToTeachers < ActiveRecord::Migration
  def change
    add_reference :teachers, :faculty, index: true
  end
end
