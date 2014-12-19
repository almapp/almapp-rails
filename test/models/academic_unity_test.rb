# == Schema Information
#
# Table name: academic_unities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  faculty_id  :integer
#  slug        :string(255)      not null
#  url         :string(255)
#  email       :string(255)
#  address     :string(255)
#  information :text
#  facebook    :string(255)
#  twitter     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  short_name  :string(255)      not null
#

require 'test_helper'

class AcademicUnityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
