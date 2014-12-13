# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  title           :string(255)      not null
#  description     :text
#  publish_date    :datetime
#  place_id        :integer
#  from_date       :datetime
#  to_date         :datetime         not null
#  slug            :string(255)      not null
#  user_id         :integer
#  group_id        :integer
#  organization_id :integer
#  faculty_id      :integer
#  facebook_url    :string(255)
#  external_url    :string(255)
#  private         :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#

class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :to_date, presence: true
  validate :has_owner

  validates_time :publish_date, after: lambda { 5.minute.from_now }, before: :to_date
  validates_time :to_date, after: :from_date

  def has_owner
    errors.add(:user, 'must add at least one owner') unless (self.user || self.group || self.faculty_id || self.organization)
  end


  belongs_to :place
  belongs_to :user
  belongs_to :group
  belongs_to :organization

  extend FriendlyId
  friendly_id :title, use: :slugged



end
