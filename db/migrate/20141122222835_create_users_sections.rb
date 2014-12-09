class CreateUsersSections < ActiveRecord::Migration
  def change
    create_table :users_sections, id: false do |t|
      t.belongs_to :user, null: false
      t.belongs_to :section, null: false
      t.integer :year
      t.integer :semester

      t.timestamps
    end
  end
end
