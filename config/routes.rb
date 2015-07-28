Rails.application.routes.draw do
  apipie
  resources :contacts do
  resources :reservations
  end
  resources :reservations
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
  get 'welcome/index'
  get 'welcome/foo'
  # Custom
  get 'custom' => 'custom#index'
  get 'custom/:id/show' => 'custom#show'
  get 'custom/new' => 'custom#new'
  post 'custom' => 'custom#create'
  # Contacts + documentation
  get 'contacts' => 'contacts#index'
  get 'contacts/:id/show' => 'contacts#show'
  post 'contacts' => 'contacts#create'
  patch 'contacts/:id/edit' => 'contacts#update'
  delete 'contacts/:id/delete' => 'contacts#destroy'
  scope :api do
      get 'contacts' => 'contacts#index'
      get 'contacts/show'
      post 'cotacts' => 'contacts#create'
      patch 'contacts/:id/edit' => 'contacts#update'
      delete 'contacts/:id/delete' => 'contacts#destroy'
  end
  
  # Dining Tables + documentation
  get 'dining_tables' => 'dining_tables#index'
  get 'dining_tables/show'
  scope :api do
      get 'dining_tables' => 'dining_tables#index'
      get 'dining_tables/show'
  end
  
  # Reservations + documentation
  get 'reservations' => 'reservations#index'
  get 'reservations/:id/show' => 'reservations#show'
  post 'reservations' => 'reservations#create'
  patch 'reservations/:id/edit' => 'reservations#update'
  delete 'reservations/:id/delete' => 'reservations#destroy'
  scope :api do
      get 'reservations' => 'reservations#index'
      get 'reservations/show'
      post 'reservations' => 'reservations#create'
      patch 'reservations/:id/edit' => 'reservations#update'
      delete 'reservations/:id/delete' => 'reservations#destroy'
  end
  
  # Zones + documentation
  get 'zones' => 'zones#index'
  get 'zones/:zone_id/dining_tables' => 'dining_tables#index'
  get 'zones/show'
  scope :api do
      get 'zones' => 'zones#index'
      get 'zones/show'
  end
end
