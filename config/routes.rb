OctoberServer::Application.routes.draw do
  get 'info' => 'info#info'

  root to: redirect('/info.json')
end

