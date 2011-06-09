class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization
end
