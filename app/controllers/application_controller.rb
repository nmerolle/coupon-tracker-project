class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery


  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end
end
