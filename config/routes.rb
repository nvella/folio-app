Rails.application.routes.draw do
  resources :folio

  root 'landing#index'
end
