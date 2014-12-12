class AddCurriculumToCareers < ActiveRecord::Migration
  def change
    add_column :careers, :curriculum_url, :string
  end
end
