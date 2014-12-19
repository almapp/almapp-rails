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

  def self.day_for_char(c)
    case c
      when 'L'
        1
      when 'M'
        2
      when 'W'
        3
      when 'J'
        4
      when 'V'
        5
      when 'S'
        6
      else
        7
    end
  end

  def self.modules_for_loader(input)
    array = Array.new
    input.gsub(' ', '').split(';').each do |statement|
      days = statement.split(':')[0]
      blocks = statement.split(':')[1]
      days.split('-').each do |d|
        blocks.split(',').each do |b|
          if b.include? 'a'
            for t in b.split('a')[0]..b.split('a')[1] do
              result = ScheduleModule.find_by_day_and_block(day_for_char(d), t)
              array.push(result)
            end
          else
            result = ScheduleModule.find_by_day_and_block(day_for_char(d), b)
            array.push(result)
          end
        end
      end
    end
    return array.empty? ? nil : array
  end

  def courses
    self.sections.course
  end
end
