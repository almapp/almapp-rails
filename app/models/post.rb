# == Schema Information
#
# Table name: posts
#
#  id                     :integer          not null, primary key
#  content                :text             default(""), not null
#  notify                 :boolean          default(FALSE), not null
#  user_id                :integer          not null
#  group_id               :integer
#  faculty_id             :integer
#  camp_id                :integer
#  organization_id        :integer
#  target_group_id        :integer
#  target_faculty_id      :integer
#  target_camp_id         :integer
#  target_organization_id :integer
#  place_id               :integer
#  event_id               :integer
#  created_at             :datetime
#  updated_at             :datetime
#

class Post < ActiveRecord::Base
  validates :user, presence: true
  validates :notify, presence: true
  validates :content, length: {
                    minimum: 2,
                    maximum: 700,
                    too_short: 'must have at least %{count} words.',
                    too_long: 'must have at most %{count} words.'
                    }, presence: true

  validate :one_target
  validate :valid_publisher

  def one_target
    targets = [self.target_group_id, self.target_faculty_id, self.target_camp_id, self.target_organization_id]
    target_count = 0
    targets.each do |t|
      target_count += 1 if t.present?
    end
    errors.add(:target_group, :target_faculty, :target_camp, :target_organization, 'must have only one target.') unless target_count == 1
  end

  def valid_publisher
    publishers = [self.group_id, self.faculty_id, self.camp_id, self.organization_id]
    publishers_count = 0
    publishers.each do |p|
      publishers_count += 1 if p.present?
    end
    errors.add(:group, :faculty, :camp, :organization, 'must have only one publisher.') unless publishers_count == 1

  end

  belongs_to :poster_user, class_name: 'User', foreign_key: 'user_id'

  belongs_to :poster_group, class_name: 'Group', foreign_key: 'group_id'
  belongs_to :poster_faculty, class_name: 'Faculty', foreign_key: 'faculty_id'
  belongs_to :poster_camp, class_name: 'Camp', foreign_key: 'camp_id'
  belongs_to :poster_organization, class_name: 'Organization', foreign_key: 'organization_id'

  belongs_to :target_group, class_name: 'Group', foreign_key: 'target_group_id'
  belongs_to :target_faculty, class_name: 'Faculty', foreign_key: 'target_faculty_id'
  belongs_to :target_camp, class_name: 'Camp', foreign_key: 'target_camp_id'
  belongs_to :target_organization, class_name: 'Organization', foreign_key: 'target_organization_id'

  belongs_to :place
  belongs_to :event
end
