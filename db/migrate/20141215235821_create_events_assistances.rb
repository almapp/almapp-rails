class CreateEventsAssistances < ActiveRecord::Migration
  def change
    create_table :events_assistances do |t|
      t.references :event, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
