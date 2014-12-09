# == Schema Information
#
# Table name: teachers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  faculty_id  :integer
#  information :text
#  url         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Teacher < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9]+[a-z0-9\._-]*@[a-z0-9\.]+\.[a-z]{2,5}\z/i

  has_and_belongs_to_many :sections
  belongs_to :faculty
end
