# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  title           :string(255)      not null
#  description     :text
#  publish_date    :datetime
#  place_id        :integer
#  from_date       :datetime
#  to_date         :datetime         not null
#  slug            :string(255)      not null
#  user_id         :integer
#  group_id        :integer
#  organization_id :integer
#  faculty_id      :integer
#  facebook_url    :string(255)
#  external_url    :string(255)
#  private         :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
