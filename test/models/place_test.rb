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
#  slug        :string(255)
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
