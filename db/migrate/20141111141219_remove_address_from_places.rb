class RemoveAddressFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :address
  end
end
