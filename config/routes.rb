Rails.application.routes.draw do
  root "index#index"

  resources :books, only: [:create, :show]
end
