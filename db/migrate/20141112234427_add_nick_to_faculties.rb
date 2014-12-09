class AddNickToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :nick, :string
  end
end
