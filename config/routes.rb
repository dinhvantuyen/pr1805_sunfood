Rails.application.routes.draw do
	root "static_pages#home"

  namespace :admin do
    root "dashboard#index"
  end

end
