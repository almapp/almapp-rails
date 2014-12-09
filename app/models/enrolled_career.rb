# == Schema Information
#
# Table name: enrolled_careers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  career_id  :integer
#  curriculum :string(255)
#  ingress    :date
#  created_at :datetime
#  updated_at :datetime
#

class EnrolledCareer < ActiveRecord::Base
  belongs_to :user
  belongs_to :career
end
