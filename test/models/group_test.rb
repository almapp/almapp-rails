# == Schema Information
#
# Table name: groups
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)      not null
#  url             :string(255)
#  facebook        :string(255)
#  twitter         :string(255)
#  information     :text
#  expiration      :date
#  organization_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
