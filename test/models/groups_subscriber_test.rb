# == Schema Information
#
# Table name: groups_subscribers
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  group_id      :integer
#  visible_mail  :boolean          default(FALSE)
#  notifications :boolean          default(FALSE)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class GroupsSubscriberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
