class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable



  def self.from_omniauth(auth)
    # where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end


  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    # @graph = Koala::Facebook::API.new(oauth_access_token)

  end
end
