# == Schema Information
#
# Table name: teachers
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  email             :string(255)
#  information       :text
#  url               :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  slug              :string(255)
#  academic_unity_id :integer
#

class Teacher < ActiveRecord::Base
  #validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9]+[a-z0-9\._-]*@[a-z0-9\.]+\.[a-z]{2,5}\z/i
  validates :name, presence: true

  has_and_belongs_to_many :sections
  belongs_to :academic_unity

  def faculty
    self.academic_unity.faculty
  end

  def courses
    self.sections.courses
  end

  #before_validation :create_slug

  extend FriendlyId
  friendly_id :slug_candidates, use: :scoped, scope: :academic_unity # http://www.rubydoc.info/github/norman/friendly_id/FriendlyId/Scoped

  #def create_slug
  #  self.username = self.email.split('@').first
  #end

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
    :name,
    [:name, :id]
    ]
  end

end
