class ChangeIndexPlaces < ActiveRecord::Migration
  def change
    remove_index :places, :pid
    add_index :places, [:pid, :camp_id], :unique => true
  end
end
