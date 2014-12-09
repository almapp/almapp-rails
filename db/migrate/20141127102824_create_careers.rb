class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :name, null: false
      t.string :url
      t.text :information
      t.references :faculty, index: true

      t.timestamps
    end
  end
end
