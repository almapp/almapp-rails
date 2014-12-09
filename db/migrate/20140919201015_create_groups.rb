class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :email, :null => false
      t.string :url
      t.string :facebook
      t.string :twitter
      t.string :information
      t.date :expiration
      t.references :organization, index: true

      t.timestamps
    end
  end
end
