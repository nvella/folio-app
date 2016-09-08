Rails.application.routes.draw do
  resources :folios

  root 'landing#index'
end
