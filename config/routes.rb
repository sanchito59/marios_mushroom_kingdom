Rails.application.routes.draw do
  root to: 'products#home_page'
  resources :products do
    resources :reviews
  end
end
