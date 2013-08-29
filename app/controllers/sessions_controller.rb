class SessionsController < ApplicationController
  def create
    update_user
    redirect_to client_app_url
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
      User.create(attributes.merge(uid: uid))
    end
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
