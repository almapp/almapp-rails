class AddFacultyToGroups < ActiveRecord::Migration
  def change
    add_reference :groups, :faculty, index: true
  end
end
