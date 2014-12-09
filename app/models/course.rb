# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  initials     :string(255)
#  name         :string(255)
#  faculty_id   :integer
#  credits      :integer
#  availability :boolean          default(TRUE)
#  description  :text
#  capacity     :integer
#  enrolled     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Course < ActiveRecord::Base
  validates :initials, presence: true, uniqueness: true

  has_many :sections
  belongs_to :faculty

  # has_many :teachers, through: :sections
end
