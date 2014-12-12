# == Schema Information
#
# Table name: schedule_modules
#
#  id         :integer          not null, primary key
#  initials   :string(255)      not null
#  day        :integer          not null
#  block      :integer          not null
#  start_time :string(255)      not null
#  end_time   :string(255)      not null
#

class ScheduleModule < ActiveRecord::Base
  validates :initials, presence: true
  validates :day, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 7 }
  validates :block, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :start_time, presence: true
  validates :end_time, presence: true

  has_many :schedule_items
  has_many :sections, through: :schedule_items
  has_many :places, through: :schedule_items

  def courses
    self.sections.course
  end
end
