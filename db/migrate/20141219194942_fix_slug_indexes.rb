class FixSlugIndexes < ActiveRecord::Migration
  def change
    remove_index :academic_unities, :slug
    add_index :academic_unities, [:slug, :faculty_id], :unique => true

    remove_index :camps, :slug
    add_index :camps, [:slug, :organization_id], :unique => true

    remove_index :careers, :slug
    add_index :careers, [:slug, :academic_unity_id], :unique => true

    remove_index :courses, :slug
    add_index :courses, [:slug, :academic_unity_id], :unique => true

    remove_index :faculties, :slug
    add_index :faculties, [:slug, :camp_id], :unique => true

    remove_index :users, :slug
    add_index :users, [:slug, :organization_id], :unique => true

  end
end
