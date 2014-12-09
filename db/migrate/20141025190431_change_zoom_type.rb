class ChangeZoomType < ActiveRecord::Migration
  def change
    change_column :faculties, :zoom, :float, :default => 0.0
    change_column :faculties, :angle, :float, :default => 0.0
    change_column :faculties, :tilt, :float, :default => 0.0

  end
end
