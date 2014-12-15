# == Schema Information
#
# Table name: friendships
#
#  user_id    :integer          not null
#  friend_id  :integer          not null
#  accepted   :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class Friendship < ActiveRecord::Base
  validates :user, presence: true
  validates :friend, presence: true

  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
