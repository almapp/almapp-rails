# == Schema Information
#
# Table name: group_comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  group_id   :integer          not null
#  comment    :text             default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

class GroupComment < ActiveRecord::Base
  include CommentModule

  validates :group_id, presence: true
  belongs_to :group
  belongs_to :user

end
