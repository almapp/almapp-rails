# == Schema Information
#
# Table name: organization_admins
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  organization_id :integer          not null
#  appointment     :string(255)      default(""), not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class OrganizationAdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
