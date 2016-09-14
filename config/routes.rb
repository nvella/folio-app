Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :folios

  resources :folio_pages, path: '/folios/pages'
  resources :folio_page_rows, path: '/folios/pages/rows', only: [:create]

  root 'landing#index'
end
