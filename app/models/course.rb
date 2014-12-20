# == Schema Information
#
# Table name: courses
#
#  id                :integer          not null, primary key
#  initials          :string(255)      not null
#  name              :string(255)
#  credits           :integer
#  availability      :boolean          default(TRUE)
#  description       :text
#  capacity          :integer
#  enrolled          :integer
#  created_at        :datetime
#  updated_at        :datetime
#  slug              :string(255)
#  academic_unity_id :integer
#

class Course < ActiveRecord::Base
  validates :initials, presence: true, uniqueness: true
  validates :academic_unity_id, presence: true

  # Causes error if left empty
  # validates :capacity, numericality: {greater_than_or_equal_to: 0}
  validates :credits, numericality: {greater_than_or_equal_to: 0}
  # validates :enrolled, numericality: {greater_than_or_equal_to: 0}

  has_many :sections
  belongs_to :academic_unity

  def teachers
    self.sections.teachers
  end
  #has_many :teachers, through: :sections # TODO Teacher on course

  extend FriendlyId
  friendly_id :initials, use: :scoped, scope: :academic_unity # http://www.rubydoc.info/github/norman/friendly_id/FriendlyId/Scoped

  def normalize_friendly_id(string)
    super.upcase
  end

end
