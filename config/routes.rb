BlogAggregator::Application.routes.draw do

  resources :feeds
  resources :users
  resources :school_sessions

  resources :bloggers, param: :slug do
    resources :feeds, param: :slug
  end

                      get  '/unsubscribe/:signature' => 'subscribers#unsubscribe'

                                   post '/subscribe' => 'subscribers#create'
                                 post '/unsubscribe' => 'subscribers#destroy'

                                     get '/register' => 'users#new'
                                    post '/register' => 'users#create'
                      
                                       get  '/login' => 'sessions#new'
                                      get  '/logout' => 'sessions#destroy'
                      
                                    post '/sessions' => 'sessions#create'

                         get '/entries/:slug/update' => 'entries#update'
                             post '/entries/publish' => 'entries#publish'
                                 post '/entries/tag' => 'entries#tag'


                             get '/feeds/create_all' => 'feeds#create_all'
                          get '/feeds/tag/:tag_slug' => 'feeds#index_by_tag'

                                 post '/users/tweet' => 'twitter#tweet'
                              get '/users/dashboard' => 'users#show'
                               get '/users/:id/tags' => 'users#tags'

                  get '/users/:id/entries/:tag_slug' => 'users#admin_tag_view'
                  get '/users/:id/entry/:entry_slug' => 'users#admin_blog_view'
             get '/users/:id/bloggers/:blogger_slug' => 'users#admin_blogger_view'
                           get '/users/:id/mainpage' => 'users#admin_mainpage_view'

         get '/users/bloggers/destroy/:blogger_slug' => 'bloggers#destroy'
         get '/users/school_sessions/destroy/:id'    => 'school_sessions#destroy'
 get '/users/:id/schoolsession/:school_session_slug' => 'users#admin_session_view'

                                get '/tags/:id/edit' => 'tags#edit'
                             post '/tags/:id/update' => 'tags#update'
                              get '/tags/:id/ignore' => 'tags#ignore'
                                 post '/tags/create' => 'tags#find_or_create'

         get '/bloggers/:blogger_slug/entries/:slug' => 'entries#show'



  root 'feeds#index'
end
