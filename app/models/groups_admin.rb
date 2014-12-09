# == Schema Information
#
# Table name: groups_admins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class GroupsAdmin < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
end
