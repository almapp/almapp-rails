# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)      not null
#  privilege       :string(255)      default("default")
#  password_digest :string(255)
#  organization_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  PRIVILEGES = [PRIVILEGE_DEFAULT = 'default', PRIVILEGE_ADMIN = 'admin']

  validates :privilege, presence: true, inclusion: {in: PRIVILEGES}
  validates :organization_id, presence: true
  validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9]+[a-z0-9\._-]*@[a-z0-9\.]+\.[a-z]{2,5}\z/i
  # validates :password_digest, presence: true

  has_secure_password

  belongs_to :organization
  has_many :posts

  has_many :groups_admins
  has_many :manageable_groups, through: :groups_admins, source: :group

  has_many :groups_subscribers
  has_many :subscribed_groups, through: :groups_subscribers, source: :group

  has_and_belongs_to_many :sections

  has_many :assistantships
  has_many :assisting_sections, through: :assistantships, source: :section

  has_many :enrolled_careers
  has_many :careers, through: :enrolled_careers

  private
  def set_as_admin(is_admin)
    self.privilege = (is_admin) ? User::PRIVILEGE_ADMIN : User::PRIVILEGE_DEFAULT
  end

end
