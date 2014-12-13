# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  initials     :string(255)      not null
#  name         :string(255)
#  credits      :integer
#  availability :boolean          default(TRUE)
#  description  :text
#  capacity     :integer
#  enrolled     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  faculty_id   :integer
#  slug         :string(255)
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
