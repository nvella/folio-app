class User < ApplicationRecord
  has_many :folios, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

      # Set the image from Google if the user has one
      if auth.info.image
        user.image = auth.info.image
      end

      user.save!
    end
  end
end
