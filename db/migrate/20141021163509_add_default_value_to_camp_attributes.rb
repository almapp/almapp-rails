class AddDefaultValueToCampAttributes < ActiveRecord::Migration
  def change
    change_column :camps, :zoom, :integer, :default => 0
    change_column :camps, :angle, :integer, :default => 0
    change_column :camps, :tilt, :integer, :default => 0

    add_index :camps, :cid, :unique => true
  end
end
