# == Schema Information
#
# Table name: posts
#
#  id                     :integer          not null, primary key
#  content                :text             default(""), not null
#  user_id                :integer          not null
#  group_id               :integer
#  faculty_id             :integer
#  camp_id                :integer
#  organization_id        :integer
#  target_group_id        :integer
#  target_faculty_id      :integer
#  target_camp_id         :integer
#  target_organization_id :integer
#  place_id               :integer
#  event_id               :integer
#  created_at             :datetime
#  updated_at             :datetime
#  notify                 :boolean          default(FALSE), not null
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
