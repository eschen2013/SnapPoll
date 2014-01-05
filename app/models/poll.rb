class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :invites
  has_many :votes, through :invites
end
