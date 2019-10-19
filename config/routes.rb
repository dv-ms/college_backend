require 'sidekiq/web'
require 'api_constraints'

Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
    devise_for :users, path: 'users', controllers: {sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'}
    
    devise_for :admins, path: 'admins', controllers: {sessions: 'admins/sessions', registrations: 'admins/registrations'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
  get 'about' => 'about#index'

  #assignment
  get '/user/new' => 'user#new'
  get '/user/login' => 'user#login'
  get '/user/tweet' => 'user#tweet_screen'
  post '/user/tweet' => 'user#tweet'
  
  resources :departments
  get '/department/search' => 'departments#search'
  
  post '/upload/image/any' => 'user#upload_any_image'

  resources :sections

  resources :teachers

  resources :subjects

  resources :students

  resources :exams

  resources :assignments

  resources :users

  resources :admins

  %w( 404 422 500 ).each do |code|
    get code, controller: 'application', action: 'error', code: code
  end


  #REST JSON API
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :departments
      post '/admin' => 'admin#create'
    end

    scope module: :v2, constraints: ApiConstraints.new(version: 2) do
      
    end
  end




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
end