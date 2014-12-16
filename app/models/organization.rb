# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  information :text
#  image       :string(255)
#  url         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  facebook    :string(255)
#  twitter     :string(255)
#  slug        :string(255)      not null
#

class Organization < ActiveRecord::Base
  validates :name, presence: true
  validates :slug,
            presence: true,
            uniqueness: true,
            exclusion: { in: %w(www mail ftp dev help), message: '%{value} is reserved.' },
            format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i, message: 'incorrect format' }

  has_many :users, class_name: 'User'
  has_many :groups

  has_many :camps
  has_many :faculties, through: :camps

  has_many :places, through: :camps
  has_many :careers, through: :faculties
  has_many :courses, through: :faculties
  has_many :teachers, through: :faculties

  has_many :published_posts, source: :poster_organization, class_name: 'Post'

  has_many :organization_admins
  has_many :admins, through: :organization_admins, source: :user

  def add_admin(user)
    OrganizationAdmin.create!(organization: self, user: user)
  end

  def self.find_with_subdomain(subdomain)
    self.where("lower(slug) = ?", subdomain.downcase).first if (subdomain.present? && subdomain.size != 0)
  end

end
