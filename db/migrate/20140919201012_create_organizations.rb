class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :info
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
