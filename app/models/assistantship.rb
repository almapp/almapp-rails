# == Schema Information
#
# Table name: assistantships
#
#  id         :integer          not null, primary key
#  section_id :integer          not null
#  user_id    :integer          not null
#  year       :integer          not null
#  semester   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Assistantship < ActiveRecord::Base
  belongs_to :section
  belongs_to :assistant, :class_name => 'User'
end
