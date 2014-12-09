class CreateAssistantships < ActiveRecord::Migration
  def change
    create_table :assistantships do |t|
      t.references :section, index: true, null: false
      t.references :user, index: true, null: false
      t.integer :year, null: false
      t.integer :semester, null: false

      t.timestamps
    end
  end
end
