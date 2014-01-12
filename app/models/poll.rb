class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes
  has_many :poll_invites
  accepts_nested_attributes_for :answers
  mount_uploader :image, ImageUploader
end
