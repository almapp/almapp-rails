# == Schema Information
#
# Table name: groups
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)      not null
#  url             :string(255)
#  facebook        :string(255)
#  twitter         :string(255)
#  information     :text
#  expiration      :date
#  organization_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#  faculty_id      :integer
#  slug            :string(255)
#

class Group < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9]+[a-z0-9\._-]*@[a-z0-9\.]+\.[a-z]{2,5}\z/i
  validates :name, presence: true
  validates :expiration, presence: true
  validates :organization, presence: true
  validates :faculty_id, inclusion: { in: ->(record) { record.organization.faculties } } #TODO Testing

  belongs_to :organization
  belongs_to :faculty


  has_many :groups_admins
  has_many :admins, through: :groups_admins, :source => :user # class: User

  has_many :groups_subscribers
  has_many :subscribers, through: :groups_subscribers, :source => :user

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged # you must do User.friendly.find('foo')

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
    :name,
    [:name, :id],
    ]
  end

end
