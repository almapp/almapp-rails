class MoreColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :male, :boolean, default: true
    add_column :users, :country, :string
    add_column :users, :student_id, :string
  end
end
