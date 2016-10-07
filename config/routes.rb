Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :folios

  resources :folio_pages, path: 'folios/pages' do
    post 'add_row', to: 'add_row'
    post 'merge_row_column', to: 'merge_row_column'
    get 'create_caption', to: 'create_caption'
    get 'create_image', to: 'create_image'
  end

  resources :captions, path: 'folios/pages/captions', only: [:edit, :update]
  resources :images, path: 'folios/pages/images', only: [:edit, :update]

  root 'landing#index'
end
