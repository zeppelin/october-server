class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session

  def set_token_url
    "http://localhost:8000/#/token/#{current_user.uid}"
  end

  def current_user
    User.where(uid: session[:current_user_uid]).first
  end
end

