class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session

  def client_app_url(uid)
    "http://localhost:8000/#/token/#{uid}"
  end
end

