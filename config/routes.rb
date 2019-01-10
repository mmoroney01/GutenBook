Rails.application.routes.draw do
  root "index#index"

  resources :books, only: [:index, :create, :show]

  get '/download' => 'books#download'
end
