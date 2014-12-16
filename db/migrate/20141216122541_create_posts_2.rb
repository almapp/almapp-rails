class CreatePosts2 < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content, default: '', null: false
      t.references :user, index: true, null: false
      t.references :group, index: true
      t.references :organization, index: true

      t.references :target_organization, index: true
      t.references :target_camp, index: true
      t.references :target_faculty, index: true

      t.references :place, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
