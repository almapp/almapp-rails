# == Schema Information
#
# Table name: event_comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  event_id   :integer          not null
#  comment    :text             default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class EventCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
