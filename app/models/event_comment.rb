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

class EventComment < ActiveRecord::Base
  validates :user_id, presence: true
  validates :event_id, presence: true
  validates :comment, length: {
                    minimum: 2,
                    maximum: 700,
                    too_short: "must have at least %{count} words",
                    too_long: "must have at most %{count} words"
                    }

  belongs_to :user
  belongs_to :event

end
