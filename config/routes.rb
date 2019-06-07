Rails.application.routes.draw do
  devise_for :users,
    controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  scope "(:locale)", locale: /en|vi/ do
  	root "static_pages#home"

  	resources :products
    resources :product_orders
    namespace :admin do
      root "dashboard#index"
    end

    resources :reviews
  end
end
