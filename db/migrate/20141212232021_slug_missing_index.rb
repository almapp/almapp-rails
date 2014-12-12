class SlugMissingIndex < ActiveRecord::Migration
  def change
    add_index :camps, :slug, unique: true
    add_index :faculties, :slug, unique: true
    add_index :careers, :slug, unique: true
    add_index :courses, :slug, unique: true
    add_index :groups, :slug, unique: true
    add_index :places, :slug, unique: true
    add_index :teachers, :slug, unique: true
    add_index :users, :slug, unique: true
  end
end
