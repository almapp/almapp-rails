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
#

require 'test_helper'

class CampTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
