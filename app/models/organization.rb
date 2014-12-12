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

  has_many :users
  has_many :groups

  has_many :camps
  has_many :faculties, through: :camps

  has_many :places, through: :camps
  has_many :careers, through: :faculties

  # Source: http://billpatrianakos.me/blog/2013/10/19/case-insensitive-finder-methods-in-rails/
  scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

  def self.find_with_subdomain(subdomain)
    self.ci_find('slug', subdomain)
  end

end
