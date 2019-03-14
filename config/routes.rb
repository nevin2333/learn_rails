Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

    resources :users do
      collection do
        get :sign_in
      end
    end
    
    resources :heroes

    resources :tasks

  end
end
