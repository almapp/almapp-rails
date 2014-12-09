# == Schema Information
#
# Table name: groups_subscribers
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  group_id      :integer
#  visible_mail  :boolean          default(FALSE)
#  notifications :boolean          default(FALSE)
#  created_at    :datetime
#  updated_at    :datetime
#

class GroupsSubscriber < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
end
