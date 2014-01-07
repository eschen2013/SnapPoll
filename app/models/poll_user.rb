class PollUser < ActiveRecord::Base
  belongs_to :poll
  belongs_to :user
  has_one :vote

  validates :user_id, uniqueness: { scope: :poll_id }
end
