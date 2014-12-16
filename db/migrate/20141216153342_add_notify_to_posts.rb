class AddNotifyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :notify, :boolean, default: false, null: false
  end
end
