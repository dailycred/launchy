class ApplicationController < ActionController::Base
  helper_method :current_user, :login_path, :dailycred, :signup_path

  private

  # helper method for getting the current signed in user
  def current_user
    begin
      @current_user || User.find(session[:user_id]) if session[:user_id]
    rescue
      nil
    end
  end

  # use as a before_filter to only allow signed in users
  # example:
  #   before_filter :authenticate
  def authenticate
    redirect_to auth_path unless current_user
  end

  # link to sign up
  def signup_path
    "/auth/dailycred"
  end

  # link to login
  def login_path
    "/auth/dailycred?action=signin"
  end

  # helper method for getting an instance of dailycred
  # example:
  #   dailycred.tagUser "user_id", "tag"
  #
  # for more documentation, visit https://www.dailycred.com/api/ruby
  def dailycred
    config = Rails.configuration
    @dailycred ||= Dailycred.new(config.DAILYCRED_CLIENT_ID, config.DAILYCRED_SECRET_KEY, config.dc_options)
  end
  protect_from_forgery
end
