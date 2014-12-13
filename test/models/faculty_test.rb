# == Schema Information
#
# Table name: faculties
#
#  id          :integer          not null, primary key
#  fid         :string(255)      not null
#  name        :string(255)      not null
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
#  slug        :string(255)
#  short_name  :string(255)      not null
#

require 'test_helper'

class FacultyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
