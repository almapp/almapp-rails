# == Schema Information
#
# Table name: camps
#
#  id              :integer          not null, primary key
#  cid             :string(255)      not null
#  name            :string(255)      not null
#  organization_id :integer          not null
#  address         :string(255)
#  url             :string(255)
#  description     :text
#  icon            :string(255)
#  zoom            :float            default(0.0)
#  angle           :float            default(0.0)
#  tilt            :float            default(0.0)
#  created_at      :datetime
#  updated_at      :datetime
#  facebook        :string(255)
#  twitter         :string(255)
#  phone           :string(255)
#  email           :string(255)
#  latitude        :float            default(0.0)
#  longitude       :float            default(0.0)
#  slug            :string(255)
#

class Camp < ActiveRecord::Base
  validates :cid, presence: true, uniqueness: true
  validates :name, presence: true
  validates :organization_id, presence: true

  belongs_to :organization
  has_many :faculties
  has_many :careers, through: :faculties
  has_many :places

  extend FriendlyId
  friendly_id :name, use: :scoped, scope: :organization # http://www.rubydoc.info/github/norman/friendly_id/FriendlyId/Scoped
end
