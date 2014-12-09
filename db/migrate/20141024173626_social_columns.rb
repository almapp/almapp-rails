class SocialColumns < ActiveRecord::Migration
  def change
    add_column :faculties, :facebook, :string
    add_column :faculties, :twitter, :string
    add_column :faculties, :phone, :string
    add_column :faculties, :email, :string

    add_column :camps, :facebook, :string
    add_column :camps, :twitter, :string
    add_column :camps, :phone, :string
    add_column :camps, :email, :string
  end
end
