Rails.application.routes.draw do
  root "index#index"

  resources :books, only: [:index, :create, :show]

  get '/txtdownload' => 'books#txt_download'
  get '/kindledownload' => 'books#kindle_download'
end
