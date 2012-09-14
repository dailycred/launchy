class SessionsController < ApplicationController
  before_filter :authenticate, :only => [:destroy]
  before_filter :current_user

  # Callback Route for OAuth flow
  def create
    @user = User.find_or_create_with_omniauth auth_hash
    session[:user_id] = @user.id
    redirect_to thanks_path
  end

  #GET /logout
  def destroy
    session[:user_id] = nil
    redirect_to auth_path
  end

  def info
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end

