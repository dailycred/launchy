class WelcomeController < ApplicationController
  require 'securerandom'
  before_filter :authenticate, :only => [:thanks]

  def home
    @state = SecureRandom.uuid
    session["omniauth.state"] = @state
  end

  def thanks
  end
end
