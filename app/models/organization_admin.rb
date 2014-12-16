# == Schema Information
#
# Table name: organization_admins
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  organization_id :integer          not null
#  appointment     :string(255)      default(""), not null
#  created_at      :datetime
#  updated_at      :datetime
#

class OrganizationAdmin < ActiveRecord::Base
  validates :user_id, presence: true
  validates :organization_id, presence: true

  belongs_to :user
  belongs_to :organization
end
