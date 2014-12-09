# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  information :text
#  image       :string(255)
#  url         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  facebook    :string(255)
#  twitter     :string(255)
#

class Organization < ActiveRecord::Base
  validates :name, presence: true

  has_many :users
  has_many :groups

  has_many :camps
  has_many :faculties, through: :camps
  has_many :places, through: :camps
end
