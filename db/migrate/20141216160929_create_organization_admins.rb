class CreateOrganizationAdmins < ActiveRecord::Migration
  def change
    create_table :organization_admins do |t|
      t.references :user, index: true, null: false
      t.references :organization, index: true, null: false
      t.string :appointment, null: false, default: ''

      t.timestamps
    end
  end
end
