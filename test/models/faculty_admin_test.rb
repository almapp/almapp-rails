# == Schema Information
#
# Table name: faculty_admins
#
#  id          :integer          not null, primary key
#  faculty_id  :integer          not null
#  user_id     :integer          not null
#  appointment :string(255)      default(""), not null
#  string      :string(255)      default(""), not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class FacultyAdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
