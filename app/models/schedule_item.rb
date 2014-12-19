# == Schema Information
#
# Table name: schedule_items
#
#  id                 :integer          not null, primary key
#  schedule_module_id :integer
#  section_id         :integer
#  place_name         :string(255)
#  class_type         :string(255)
#

class ScheduleItem < ActiveRecord::Base
  # TODO validates class_type ?
  # validates :section_id, presence: true
  #validates_uniqueness_of :section_id, scope: [:schedule_module_id, :place_id, ]

  belongs_to :section
  belongs_to :schedule_module
  belongs_to :place

  def semester
    self.section.try(:semester)
  end

  def year
    self.section.try(:year)
  end
end
