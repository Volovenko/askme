Rails.application.routes.draw do
  root 'users#show'

  resources :users
  resources :questions

   get 'show' => 'users#show'
end
