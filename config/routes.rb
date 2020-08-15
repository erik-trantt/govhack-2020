Rails.application.routes.draw do
  root to: 'pages#home'
  resources :chatrooms, only: :show
end
