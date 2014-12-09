# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  pid         :string(255)      not null
#  name        :string(255)
#  faculty_id  :integer
#  floor       :string(255)
#  icon        :string(255)
#  description :text
#  zoom        :float            default(0.0)
#  angle       :float            default(0.0)
#  tilt        :float            default(0.0)
#  created_at  :datetime
#  updated_at  :datetime
#  camp_id     :integer
#  latitude    :float            default(0.0)
#  longitude   :float            default(0.0)
#  gmaps       :boolean          default(TRUE)
#

class Place < ActiveRecord::Base
  validates :pid, uniqueness: true, presence: true
  validates :camp_id, presence: true

  belongs_to :faculty
  belongs_to :camp

  has_many :schedule_items
  has_many :sections, through: :schedule_items
  has_many :schedule_modules, through: :schedule_items

  delegate :organization, :to => :camp, :allow_nil => true

  geocoded_by :latitude  => :lat, :longitude => :lng
  reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode  # auto-fetch address


end
