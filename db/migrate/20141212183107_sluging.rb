class Sluging < ActiveRecord::Migration
  def change
    add_column :camps, :slug, :string, uniqueness: true
    change_column :faculties, :nick, :string, uniqueness: true
    rename_column :faculties, :nick, :slug
    add_column :careers, :slug, :string, uniqueness: true
    add_column :courses, :slug, :string, uniqueness: true
    add_column :groups, :slug, :string, uniqueness: true
    add_column :places, :slug, :string, uniqueness: true
    add_column :teachers, :slug, :string, uniqueness: true
    add_column :users, :slug, :string, uniqueness: true
  end
end
