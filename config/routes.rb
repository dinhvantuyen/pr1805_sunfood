Rails.application.routes.draw do
	root "static_pages#home"

  namespace :admin do
    root "dashboard#index"
    resources :products
  end

end
