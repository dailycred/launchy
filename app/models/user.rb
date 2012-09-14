class User < ActiveRecord::Base
  serialize :facebook, Hash
  serialize :tags, Array
  serialize :referred, Array

  attr_accessible :email, :id, :username, :created, :verified, :admin, :referred_by, :referred, :facebook, :tags, :provider, :uid, :token

  def self.find_or_create_with_omniauth(model)
    @user = User.find_by_provider_and_uid(model[:provider], model[:uid]) || User.new
    @user.update_attributes model[:info]
    @user
  end

end
