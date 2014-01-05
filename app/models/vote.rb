class Vote < ActiveRecord::Base
  belongs_to :invite
  belongs_to :answer
end
