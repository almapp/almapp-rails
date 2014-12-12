# == Schema Information
#
# Table name: careers
#
#  id             :integer          not null, primary key
#  name           :string(255)      not null
#  url            :string(255)
#  information    :text
#  faculty_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  curriculum_url :string(255)
#

class Career < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :faculty

  has_many :enrolled_careers
  has_many :students, through: :enrolled_careers, source: :user
end
