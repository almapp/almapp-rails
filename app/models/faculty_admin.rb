# == Schema Information
#
# Table name: faculty_admins
#
#  id          :integer          not null, primary key
#  faculty_id  :integer          not null
#  user_id     :integer          not null
#  appointment :string(255)      default(""), not null
#  string      :string(255)      default(""), not null
#  created_at  :datetime
#  updated_at  :datetime
#

class FacultyAdmin < ActiveRecord::Base
  validates :user_id, presence: true
  validates :faculty_id, presence: true

  belongs_to :faculty
  belongs_to :user
end
