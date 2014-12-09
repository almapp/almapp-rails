# == Schema Information
#
# Table name: faculties
#
#  id          :integer          not null, primary key
#  fid         :string(255)      not null
#  name        :string(255)      not null
#  nick        :string(255)
#  camp_id     :integer
#  address     :string(255)
#  url         :string(255)
#  description :text
#  icon        :string(255)
#  zoom        :float            default(0.0)
#  angle       :float            default(0.0)
#  tilt        :float            default(0.0)
#  created_at  :datetime
#  updated_at  :datetime
#  facebook    :string(255)
#  twitter     :string(255)
#  phone       :string(255)
#  email       :string(255)
#  floor       :string(255)
#  latitude    :float            default(0.0)
#  longitude   :float            default(0.0)
#

class Faculty < ActiveRecord::Base
  validates :fid, presence: true, uniqueness: true
  validates :name, presence: true
  validates :camp_id, presence: true

  belongs_to :camp
  delegate :organization, :to => :camp, :allow_nil => true

  has_many :places
  has_many :teachers
  has_many :courses
  has_many :careers
end
