class AddCampToPlaces < ActiveRecord::Migration
  def change
    add_reference :places, :camp, index: true
  end
end
