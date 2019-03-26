Rails.application.routes.draw do
  scope 'api' do
    use_doorkeeper
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

    resources :users do
      collection do
        get :sign_in
      end
    end
    
    resources :heroes

    resources :tasks

    resources :brands

    resources :change_point_rules

    resources :document_categories

    resources :document_files

    resources :documents

    resources :image_categories

    resources :images do
      collection do
        post :upload
      end
    end

    resources :inventory_skus

    resources :members

    resources :product_categories

    resources :product_labels

    resources :product_measurement_units

    resources :product_reviews

    resources :products do
      collection do
        post :add_variant_property
        get :search_variant_property
      end
    end

    resources :shops

    resources :system_languages

    resources :product_attributes

    resources :product_attribute_values

  end
end
