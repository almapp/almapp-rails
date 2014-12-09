class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, :null => false, :unique => true
      t.string :privilege, :default => 'default'
      t.string :password_digest
      t.references :organization, index: true

      t.timestamps
    end
  end
end
