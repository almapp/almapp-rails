class FixTeacherSlugIndex < ActiveRecord::Migration
  def change
    remove_index :teachers, :slug
    add_index :teachers, [:slug, :academic_unity_id], :unique => true
  end
end
