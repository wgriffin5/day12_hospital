class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # def landing_page
  #   @disable_nav = true
  # end
  def disable_nav
    @disable_nav = true
  end
  
  protect_from_forgery with: :exception
end
