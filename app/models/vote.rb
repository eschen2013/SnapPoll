class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll
  belongs_to :answer

  validates :poll, uniqueness: { scope: :user,
    message: "User already voted in this poll" }
end
