# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)      not null
#  password_digest :string(255)
#  organization_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#  slug            :string(255)
#  username        :string(255)      not null
#

class User < ActiveRecord::Base

  def self.find_for_authentication(warden_conditions)
    where(:email => warden_conditions[:email], :subdomain => warden_conditions[:subdomain]).first
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, request_keys: [:subdomain]

  validates :organization_id, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9]+[a-z0-9\._-]*@[a-z0-9\.]+\.[a-z]{2,5}\z/i
  validates :subdomain, presence: true

  before_validation :set_subdomain

  def set_subdomain
    self.subdomain = self.organization.slug.downcase
  end

  belongs_to :organization

  has_many :groups_admins
  has_many :manageable_groups, through: :groups_admins, source: :group

  has_many :groups_subscribers
  has_many :subscribed_groups, through: :groups_subscribers, source: :group

  has_and_belongs_to_many :sections

  has_many :assistantships
  has_many :assisting_sections, through: :assistantships, source: :section

  has_many :enrolled_careers
  has_many :careers, through: :enrolled_careers

  before_validation :create_slug

  extend FriendlyId
  friendly_id :slug_candidates, use: :scoped, scope: :organization # you must do User.friendly.find('foo')

  def create_slug
    self.username = self.email.split('@').first
  end

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :username,
      [:username, :id]
    ]
  end


end
