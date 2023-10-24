Rails.application.routes.draw do
  resources :mining_types
  root to: 'welcome#index'

  get 'welcome/index'

  resources :coins


end
