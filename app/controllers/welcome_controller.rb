class WelcomeController < ApplicationController
  before_filter :authenticate, :only => [:thanks]

  def home
    if !current_user.nil?
      redirect_to :controller => 'welcome', :action => 'thanks'
    end
    set_state
  end

  def thanks
  end
end
