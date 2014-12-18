class AddMisingIndexes < ActiveRecord::Migration
  def change
    add_index :careers, :academic_unity_id
    add_index :courses, :academic_unity_id
    add_index :teachers, :academic_unity_id

  end
end
