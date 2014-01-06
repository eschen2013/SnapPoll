class Vote < ActiveRecord::Base
  belongs_to :poll_user
  belongs_to :answer
end
