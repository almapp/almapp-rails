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
#

class Group < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9]+[a-z0-9\._-]*@[a-z0-9\.]+\.[a-z]{2,5}\z/i
  validates :name, presence: true
  validates :expiration, presence: true
  validates :organization, presence: true
  validates :faculty, inclusion: { in: ->(record) { record.organization.faculty } } #TODO Testing

  belongs_to :organization
  belongs_to :faculty


  has_many :groups_admins
  has_many :admins, through: :groups_admins, :source => :user # class: User

  has_many :groups_subscribers
  has_many :subscribers, through: :groups_subscribers, :source => :user

end
