# == Schema Information
#
# Table name: teachers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  information :text
#  url         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  faculty_id  :integer
#  slug        :string(255)
#  username    :string(255)      not null
#

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
