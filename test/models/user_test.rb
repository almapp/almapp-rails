# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)      not null
#  password_digest :string(255)
#  organization_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#  slug            :string(255)
#  username        :string(255)      not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
