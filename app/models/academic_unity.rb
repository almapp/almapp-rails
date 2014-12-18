# == Schema Information
#
# Table name: academic_unities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  faculty_id  :integer
#  slug        :string(255)      not null
#  url         :string(255)
#  email       :string(255)
#  address     :string(255)
#  information :text
#  facebook    :string(255)
#  twitter     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class AcademicUnity < ActiveRecord::Base
  validates :name, presence: true
  validates :faculty_id, presence: true

  belongs_to :faculty

  has_many :teachers
  has_many :courses
  has_many :careers

  extend FriendlyId
  friendly_id :name, use: :scoped, scope: :faculty # http://www.rubydoc.info/github/norman/friendly_id/FriendlyId/Scoped

end
