class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :poll_invites, dependent: :destroy
  accepts_nested_attributes_for :answers
  mount_uploader :image, ImageUploader
end
