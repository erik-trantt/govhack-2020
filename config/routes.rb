Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/chat', to: 'pages#chat'

  # for API
  post '/messages', to: 'messages#parse'
  get '/paths', to: 'messages#paths'
end
