class CreateAcademicUnities < ActiveRecord::Migration
  def change
    create_table :academic_unities do |t|
      t.string :name
      t.references :faculty, index: true
      t.string :slug, null: false
      t.string :url
      t.string :email
      t.string :address
      t.text :information
      t.string :facebook
      t.string :twitter

      t.timestamps
    end

    add_index :academic_unities, :slug, unique: true

    remove_column :careers, :faculty_id
    add_belongs_to :careers, :academic_unity

    remove_column :courses, :faculty_id
    add_belongs_to :courses, :academic_unity

    remove_column :teachers, :faculty_id
    add_belongs_to :teachers, :academic_unity

  end
end
