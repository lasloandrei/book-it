Rails.application.routes.draw do
  apipie
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
  
  # Contacts + documentation
  get 'contacts' => 'contacts#index'
  get 'contacts/:id' => 'contacts#show'
  scope :api do
        get 'contacts' => 'contacts#index'
        get 'contacts/show'
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
  get 'reservations/show'
  scope :api do
      get 'reservations' => 'reservations#index'
      get 'reservations/show'
    end
  # Zones + documentation
  get 'zones' => 'zones#index'
  get 'zones/show'
  scope :api do
    get 'zones' => 'zones#index'
    get 'zones/show'
  end
  
end
