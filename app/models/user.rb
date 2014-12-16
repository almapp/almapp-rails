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

  def self.find_for_authentication(warden_conditions)
    where(:email => warden_conditions[:email], :subdomain => warden_conditions[:subdomain]).first
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, request_keys: [:subdomain]

  validates :organization_id, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9]+[a-z0-9\._-]*@[a-z0-9\.]+\.[a-z]{2,5}\z/i
  validates :subdomain, presence: true

  before_validation :set_subdomain

  def set_subdomain
    self.subdomain = self.organization.slug.downcase
  end

  belongs_to :organization

  #has_many :friendships
  #has_many :user_friends, -> { where(friendships: {accepted: :true}).order('name DESC') }, through: :friendships, source: :friend, :foreign_key => "friend_id"
  #has_many :inverse_user_friends, -> { where(friendships: {accepted: :true}).order('name DESC') }, through: :friendships, source: :user

  #has_many :pending_user_friends, -> { where(friendships: {accepted: :false}).order('name DESC') }, through: :friendships, source: :friend, :foreign_key => "user_id"
  #has_many :pending_inverse_user_friends, -> { where(friendships: {accepted: :false}).order('name DESC') }, through: :friendships, source: :user, :foreign_key => "friend_id"


  #def friends
  #  User.select("users.name, users.username, users.email ").joins(:career_category).joins(:campus => :school).where("campus_programs.enabled = true and campuses.enabled = true and schools.enabled = true and career_categories.id = 2").group("schools.id").order("schools.name")
  #  (user_friends.all + inverse_user_friends.all).uniq
  #end

  #def pending_friends
  #  (pending_user_friends.all + pending_inverse_user_friends.all).uniq
  #end

  has_many :friendships

  def friends
    # (friends.all + inverse_friends.all).uniq
    # User.connection.execute('SELECT * FROM users WHERE user_id IN ((SELECT friend_id FROM friendships WHERE user_id = (?)) UNION (SELECT user_id FROM friendships WHERE friend_id = (?)))') #, :skip_logging)
    User.where('users.id IN ((SELECT friend_id FROM friendships WHERE user_id = (?) AND accepted = true) UNION (SELECT user_id FROM friendships WHERE friend_id = (?)  AND accepted = true))', self.id, self.id) #, :skip_logging)
  end

  def pending_friends
    User.where('users.id IN ((SELECT friend_id FROM friendships WHERE user_id = (?) AND accepted = false) UNION (SELECT user_id FROM friendships WHERE friend_id = (?)  AND accepted = false))', self.id, self.id)
  end

  has_many :groups_admins
  has_many :manageable_groups, through: :groups_admins, source: :group

  has_many :groups_subscribers
  has_many :subscribed_groups, through: :groups_subscribers, source: :group

  has_many :organization_admins
  has_many :manageable_organizations, through: :organization_admins, source: :organization

  has_many :camp_admins
  has_many :manageable_camps, through: :camp_admins, source: :camp

  has_many :faculty_admins
  has_many :manageable_faculties, through: :faculty_admins, source: :faculty

  has_and_belongs_to_many :sections

  has_many :assistantships
  has_many :assisting_sections, through: :assistantships, source: :section

  has_many :enrolled_careers
  has_many :careers, through: :enrolled_careers

  has_many :events_assistances
  has_many :events, through: :events_assistances

  has_many :published_posts, source: :poster_user, class_name: 'Post'

  def published_posts_as_group
    self.published_posts.where('group_id IS NOT NULL')
  end

  def published_posts_as_faculty
    self.published_posts.where('faculty_id IS NOT NULL')
  end

  def published_posts_as_camp
    self.published_posts.where('camp_id IS NOT NULL')
  end

  def published_posts_as_organization
    self.published_posts.where('organization_id IS NOT NULL')
  end

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
