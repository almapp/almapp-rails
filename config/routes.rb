Rails.application.routes.draw do

  resources :events

  constraints subdomain: 'dev' do
    get '/' => redirect { |params| "almapp.github.io" } #TODO redirect to github
  end

  constraints(Subdomain) do
    get '/' => 'organizations#show'

    resources :faculties, shallow: true do
      # Shallow: [:index, :new, :create]
      resources :careers
      resources :courses
      resources :teachers
    end

    resources :camps do
      resources :places, except: [:maps]
    end
    resources :places, only: [:maps]

    resources :users

    get 'maps', controller: 'places', action: 'maps'
  end

  resources :groups
  resources :organizations

  # You can have the root of your site routed with "root"
  root 'organizations#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):  resources :groups
  # resources :organizations do
  #   constraints(Subdomain) do
  #     root 'organizations#show'
  #   end
  # end

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
