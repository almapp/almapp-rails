# == Schema Information
#
# Table name: careers
#
#  id                :integer          not null, primary key
#  name              :string(255)      not null
#  url               :string(255)
#  information       :text
#  created_at        :datetime
#  updated_at        :datetime
#  curriculum_url    :string(255)
#  slug              :string(255)
#  academic_unity_id :integer
#

class Career < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :academic_unity

  has_many :enrolled_careers
  has_many :students, through: :enrolled_careers, source: :user

  extend FriendlyId
  friendly_id :name, use: :scoped, scope: :academic_unity # http://www.rubydoc.info/github/norman/friendly_id/FriendlyId/Scoped
end
