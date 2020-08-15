Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/chat', to: 'pages#chat'
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  post '/messages', to: 'messages#parse'
end
