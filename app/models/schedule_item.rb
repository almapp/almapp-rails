# == Schema Information
#
# Table name: schedule_items
#
#  schedule_module_id :integer          not null
#  section_id         :integer          not null
#  place_id           :integer
#  class_type         :string(255)
#  year               :integer
#  semester           :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class ScheduleItem < ActiveRecord::Base
  # TODO validates class_type ?

  belongs_to :section
  belongs_to :schedule_module
  belongs_to :place
end
