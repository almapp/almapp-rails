class CreateFacultyAdmins < ActiveRecord::Migration
  def change
    create_table :faculty_admins do |t|
      t.references :faculty, index: true, null: false
      t.references :user, index: true, null: false
      t.string :appointment, :string, default: '', null: false

      t.timestamps
    end
  end
end
