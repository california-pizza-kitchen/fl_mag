BlogAggregator::Application.routes.draw do

  resources :feeds
  resources :users

  resources :bloggers, param: :slug do
    resources :feeds, param: :slug
  end

  get '/unsubscribe/:signature' => 'subscribers#unsubscribe'

  post '/subscribe' => 'subscribers#create'
  post '/unsubscribe' => 'subscribers#destroy'

  get  '/register' => 'users#new'
  post '/register' => 'users#create'
  
  get  '/login' => 'sessions#new'
  get  '/logout' => 'sessions#destroy'
  
  post '/sessions' => 'sessions#create'

  get '/entries/:slug/update' => 'entries#update'
  post '/entries/publish' => 'entries#publish'
  post '/entries/tag' => 'entries#tag'


  get '/feeds/create_all' => 'feeds#create_all'
  get '/feeds/tag/:tag_slug' => 'feeds#index_by_tag'

  get '/users/dashboard' => 'users#show'
  get '/users/:id/tags' => 'users#tags'

  get '/tags/:id/edit' => 'tags#edit'
  post '/tags/:id/update' => 'tags#update'
  get '/tags/:id/ignore' => 'tags#ignore'

  root 'pages#home'


  get '/bloggers/:blogger_slug/entries/:slug' => 'entries#show'


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
