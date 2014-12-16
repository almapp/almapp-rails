# == Schema Information
#
# Table name: camp_admins
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  camp_id     :integer          not null
#  appointment :string(255)      default(""), not null
#  created_at  :datetime
#  updated_at  :datetime
#

class CampAdmin < ActiveRecord::Base
  validates :user_id, presence: true
  validates :camp_id, presence: true

  belongs_to :user
  belongs_to :camp
end
