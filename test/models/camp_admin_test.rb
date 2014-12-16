# == Schema Information
#
# Table name: camp_admins
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  camp_id     :integer          not null
#  appointment :string(255)      default(""), not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class CampAdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
