# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  number     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
