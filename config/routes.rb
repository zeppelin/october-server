OctoberServer::Application.routes.draw do
  resource :session
  get 'auth/github/callback' => 'sessions#create'

  get 'info' => 'info#info'
  root to: redirect('/info.json')
end

