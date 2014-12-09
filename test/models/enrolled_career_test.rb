# == Schema Information
#
# Table name: enrolled_careers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  career_id  :integer
#  curriculum :string(255)
#  ingress    :date
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class EnrolledCareerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
