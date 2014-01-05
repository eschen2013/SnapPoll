class Invite < ActiveRecord::Base
  belongs_to :poll
  belongs_to :user
  has_one :vote
end
