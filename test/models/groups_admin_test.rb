# == Schema Information
#
# Table name: groups_admins
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  group_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  appointment :string(255)
#

require 'test_helper'

class GroupsAdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
