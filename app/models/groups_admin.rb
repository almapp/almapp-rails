# == Schema Information
#
# Table name: groups_admins
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  group_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  appointment :string(255)
#

class GroupsAdmin < ActiveRecord::Base
  validates :user_id, presence: true
  validates :group_id, presence: true

  belongs_to :user
  belongs_to :group
end
