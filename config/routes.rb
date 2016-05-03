Rails.application.routes.draw do

  get 'analyze/index'

  get 'rsvp/:id/new' => 'rsvp#new'
  get 'rsvp/:id/new_with_new_member' => 'rsvp#new_with_new_member'
  
  post 'rsvp/:id/create' => 'rsvp#create'
  post 'rsvp/:id/create_with_new_member' => 'rsvp#create_with_new_member'

  get 'check_in/:id/new' => 'check_in#new'
  get 'check_in/:id/new_with_new_member' => 'check_in#new_with_new_member'
  
  post 'check_in/:id/create' => 'check_in#create'
  post 'check_in/:id/create_with_new_member' => 'check_in#create_with_new_member'
  
  get '/admin/events/new' => 'events#new'
  post 'event/create' => 'events#create'
  
  get '/admin/events/:id/edit' => 'events#edit'
  post '/admin/events/:id' => 'events#update'

  get 'events/index'
  get 'events/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  get 'dashboards/index'

  get 'logins/index'  
  root 'events#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
  ActiveAdmin.routes(self)
end
