Rails.application.routes.draw do
  resources :rooms
  devise_for :users

  get 'welcome/index'

  resources :questions

  root 'welcome#index'

  get 'rooms/play/:id/:question', to: 'rooms#play'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
