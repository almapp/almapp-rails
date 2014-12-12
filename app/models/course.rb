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
  validates :faculty_id, presence: true

  # Causes error if left empty
  # validates :capacity, numericality: {greater_than_or_equal_to: 0}
  validates :credits, numericality: {greater_than_or_equal_to: 0}
  # validates :enrolled, numericality: {greater_than_or_equal_to: 0}

  has_many :sections
  belongs_to :faculty

  has_many :teachers, through: :sections # TODO Teacher on course
end
