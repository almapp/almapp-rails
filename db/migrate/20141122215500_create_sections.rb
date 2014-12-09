class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :course, index: true
      t.integer :number, null: false

      t.timestamps
    end
  end
end
