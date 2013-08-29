Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['OCTOBER_GITHUB_KEY'], ENV['OCTOBER_GITHUB_SECRET']
end
