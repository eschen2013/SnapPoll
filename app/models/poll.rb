class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes
  accepts_nested_attributes_for :answers

end
