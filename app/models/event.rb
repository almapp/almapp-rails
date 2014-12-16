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

  validates_datetime :publish_date, after: lambda { 5.minute.from_now }, before: :to_date, if: 'publish_date.present?'
  validates_datetime :to_date, after: :from_date
  validates_datetime :to_date, after: lambda { 1.minute.from_now }
  validates_datetime :from_date, :on_or_after => lambda { 3.month.ago }, if: 'from_date.present?'

  def has_owner
    errors.add(:user, 'must add at least one owner') unless (self.user || self.group || self.faculty_id || self.organization)
  end


  belongs_to :place
  belongs_to :user
  belongs_to :group
  belongs_to :organization

  has_many :events_assistances
  has_many :participants, through: :events_assistances, class_name: 'User'

  has_many :comments, class_name: 'Event_comment'

  extend FriendlyId
  friendly_id :title, use: :slugged



end
