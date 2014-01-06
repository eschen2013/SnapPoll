class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :poll_users
  has_many :votes, through: :poll_users
  accepts_nested_attributes_for :answers
end
