module CommentModule
  extend ActiveSupport::Concern

  included do
    validates :user_id, presence: true
    validates :comment, length: {
                      minimum: 2,
                      maximum: 700,
                      too_short: 'must have at least %{count} words.',
                      too_long: 'must have at most %{count} words.'
                      }, presence: true
  end
end