# == Schema Information
#
# Table name: schedule_items
#
#  schedule_module_id :integer          not null
#  section_id         :integer          not null
#  created_at         :datetime
#  updated_at         :datetime
#  place_id           :integer
#  class_type         :string(255)
#

class ScheduleItem < ActiveRecord::Base
  # TODO validates class_type ?
  validates :section_id, presence: true

  belongs_to :section
  belongs_to :schedule_module
  belongs_to :place

  def semester
    self.section.semester
  end

  def year
    self.section.year
  end
end
