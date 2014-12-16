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
  include CommentModule

  validates :event_id, presence: true
  belongs_to :event
  belongs_to :user

end
