class ChangeOrganizationAndCampColumnTypes < ActiveRecord::Migration
  def change
    change_column :organizations, :information, :text

    change_column :camps, :zoom, :float, :default => 0.0
    change_column :camps, :angle, :float, :default => 0.0
    change_column :camps, :tilt, :float, :default => 0.0
  end
end
