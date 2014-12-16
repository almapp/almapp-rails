class CreateEventComments < ActiveRecord::Migration
  def change
    create_table :event_comments do |t|
      t.references :user, index: true, null: false
      t.references :event, index: true, null: false
      t.text :comment, default: '', null: false

      t.timestamps
    end
  end
end
