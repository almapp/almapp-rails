class CourseInitialsNotNull < ActiveRecord::Migration
  def change
    change_column :courses, :initials, :string, null: false, uniqueness: true
  end
end
