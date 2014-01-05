class User < ActiveRecord::Base
  has_many :polls
  has_many :invites
  has_many :poll_invites, through: :invites, class_name: "Poll"
  has_many :votes, through: :invites

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
