# == Schema Information
#
# Table name: careers
#
#  id             :integer          not null, primary key
#  name           :string(255)      not null
#  url            :string(255)
#  information    :text
#  faculty_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  curriculum_url :string(255)
#  slug           :string(255)
#

require 'test_helper'

class CareerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
