# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  initials     :string(255)      not null
#  name         :string(255)
#  credits      :integer
#  availability :boolean          default(TRUE)
#  description  :text
#  capacity     :integer
#  enrolled     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  faculty_id   :integer
#  slug         :string(255)
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

  def teachers
    self.sections.teachers
  end
  #has_many :teachers, through: :sections # TODO Teacher on course

  extend FriendlyId
  friendly_id :initials, use: :scoped, scope: :faculty # http://www.rubydoc.info/github/norman/friendly_id/FriendlyId/Scoped

end
