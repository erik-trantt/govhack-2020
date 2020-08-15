Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  get '/chat', to: 'pages#chat'
  post '/messages', to: 'messages#parse'
end
