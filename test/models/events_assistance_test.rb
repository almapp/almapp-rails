# == Schema Information
#
# Table name: events_assistances
#
#  id         :integer          not null, primary key
#  event_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class EventsAssistanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
