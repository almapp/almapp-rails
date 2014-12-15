# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  organization_id        :integer
#  created_at             :datetime
#  updated_at             :datetime
#  slug                   :string(255)
#  username               :string(255)      not null
#  subdomain              :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  admin                  :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  validates :organization_id, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9]+[a-z0-9\._-]*@[a-z0-9\.]+\.[a-z]{2,5}\z/i
  # validates :password_digest, presence: true

  belongs_to :organization

  has_many :friendships
  has_many :user_friends, -> { where(friendship: {accepted: :true}).order('name DESC') }, through: :friendships, source: :friend, class: 'User'
  has_many :inverse_user_friends, -> { where(friendship: {accepted: :true}).order('name DESC') }, through: :friendships, source: :user, class: 'User'
  has_many :pending_user_friends, -> { where(friendship: {accepted: :false}).order('name DESC') }, through: :friendships, source: :friend, class: 'User'
  has_many :pending_inverse_user_friends, -> { where(friendship: {accepted: :false}).order('name DESC') }, through: :friendships, source: :user, class: 'User'


  def friends
    (user_friends.all + inverse_user_friends.all).uniq
  end

  def pending_friends
    (pending_user_friends.all + pending_inverse_user_friends.all).uniq
  end

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
