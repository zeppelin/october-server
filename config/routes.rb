OctoberServer::Application.routes.draw do
  resource :session
  resources :issues
  resources :pomodoros

  get 'auth/github/callback' => 'sessions#create'
  get 'info' => 'info#info'
  root to: redirect('/info.json')
end
