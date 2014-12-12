class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :publish_date
      t.references :place, index: true
      t.datetime :from_date
      t.datetime :to_date, null: false
      t.string :slug, null: false, uniqueness: true
      t.references :user, index: true
      t.references :group, index: true
      t.string :facebook_url
      t.string :external_url
      t.boolean :private, default: false

      t.timestamps
    end
    add_index :events, :slug, unique: true
  end
end
