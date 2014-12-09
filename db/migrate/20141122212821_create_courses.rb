class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :initials
      t.string :name
      t.integer :credits
      t.boolean :availability, default: true
      t.text :description
      t.integer :capacity
      t.integer :enrolled

      t.timestamps
    end
    add_index :courses, :initials, unique: true
  end
end
