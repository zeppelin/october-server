class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session

  def set_token_url
    "http://localhost:3000/#/token/#{current_user.uid}"
  end

  def current_user
    User.where(uid: session[:current_user_uid]).first
  end

  def api_get(path)
    github_api.get(path)
  end

  def github_api
    @api ||= Faraday.new(url: api_base) do |conn|
      conn.request  :multipart
      conn.request  :url_encoded
      conn.request  :json

      conn.response :logger
      conn.response :json

      conn.adapter Faraday.default_adapter
    end
  end

  def api_base
    'https://api.github.com/'
  end
end

