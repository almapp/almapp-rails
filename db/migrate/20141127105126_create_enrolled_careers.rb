class CreateEnrolledCareers < ActiveRecord::Migration
  def change
    create_table :enrolled_careers do |t|
      t.references :user, index: true
      t.references :career, index: true
      t.string :curriculum
      t.date :ingress

      t.timestamps
    end
  end
end
