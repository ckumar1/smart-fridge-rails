SmartFridgeRails::Application.routes.draw do

  get "static_pages/home"
  get "static_pages/help"
  #get "static_pages/food"
  #get "static_pages/recipes"
  get "food_items/food"
  get "users/recipes"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'
  resources :users, controller: 'users'
  resources :static_pages, controller: 'static_pages'
  resources :food_items, controller: 'food_items', only: [:create, :edit, :update, :destroy]
  match 'food_items' => 'foods#create', :via => :post
  resources :recipes, controller: 'recipes'

  # Clearance endpoints available for rerouting if needed
  #   reroute clearance endpoints to use our custom controllers

  #resources :passwords,z
  #          controller: 'clearance/passwords',
  #          only: [:create, :new]
  #
  #resource :session,
  #         controller: 'clearance/sessions',
  #         only: [:create]
  #
  #resources :users,
  #          controller: 'clearance/users',
  #          only: Clearance.configuration.user_actions do
  #            resource :password,
  #                     controller: 'clearance/passwords',
  #                     only: [:create, :edit, :update]
  #          end
  #
  #get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  #delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  #
  #if Clearance.configuration.allow_sign_up?
  #  get '/sign_up' => 'clearance/users#new', as: 'sign_up'
  #end


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  # delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
