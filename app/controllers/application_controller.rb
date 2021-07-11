class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery
  helper_method :current_user, :logged_in?



  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end
end
