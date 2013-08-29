class SessionsController < ApplicationController
  def create
    user = update_user
    session[:current_user_uid] = user.uid
    redirect_to set_token_url
  end

  private
  def update_user
    user_info = auth_hash.info
    attributes = {
      name: user_info.name,
      nickname: user_info.nickname,
      email: user_info.email,
      image_url: user_info.image,
      github_url: user_info.urls["GitHub"],
      access_token: auth_hash.credentials.token
    }

    uid = auth_hash.uid
    user = User.where(uid: uid).first
    if user
      user.update_attributes(attributes)
    else
      user = User.create(attributes.merge(uid: uid))
    end
    user
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
