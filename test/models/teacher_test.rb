# == Schema Information
#
# Table name: teachers
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  email             :string(255)
#  information       :text
#  url               :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  slug              :string(255)
#  academic_unity_id :integer
#

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
