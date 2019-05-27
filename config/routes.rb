Rails.application.routes.draw do
  devise_for :users
  scope "(:locale)", locale: /en|vi/ do
  	root "static_pages#home"
  	resources :products
    namespace :admin do
      root "dashboard#index"
    end
  end
end
