class CreateCampAdmins < ActiveRecord::Migration
  def change
    create_table :camp_admins do |t|
      t.references :user, index: true, null: false
      t.references :camp, index: true, null: false
      t.string :appointment, null: false, default: ''

      t.timestamps
    end
  end
end
