class Vote < ActiveRecord::Base
  belongs_to :poll_user
  belongs_to :answer

  validates :poll_user_id, uniqueness: true
end
