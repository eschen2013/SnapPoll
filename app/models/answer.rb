class Answer < ActiveRecord::Base
  belongs_to :poll
  has_many :votes
  mount_uploader :image, ImageUploader
end
