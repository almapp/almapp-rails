# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  number     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Section < ActiveRecord::Base
  validates :course_id, presence: true

  belongs_to :course
  has_many :schedule_items

  has_many :schedule_modules, through: :schedule_items
  has_many :places, through: :schedule_items

  has_and_belongs_to_many :students, :class_name => 'User' #TODO def table name?
  has_and_belongs_to_many :teachers

end
