Rails.application.routes.draw do
  root to: 'main#index'
  match 'main/register',to: 'main#register' , as: :register , via: [:get , :post]
  get 'session/new'
  post 'session/create' ,to: 'session#create' , as: :session_create
  delete 'session/delete', to: 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
