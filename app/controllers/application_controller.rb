class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_signed_in?
    false
  end
end
