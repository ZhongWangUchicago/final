Rails.application.routes.draw do
    
    root  'sessions#new'

    # restaurants
    get '/restaurants/new'      => 'restaurants#new',  :as => "restaurants_new"
    get '/restaurants/:id/edit' => 'restaurants#edit', :as => "restaurants_edit"

    get    '/restaurants'     => 'restaurants#index',   :as => "restaurants_index"
    post   '/restaurants'     => 'restaurants#create',  :as => "restaurants_create"
    get    '/restaurants/:id' => 'restaurants#show',    :as => "restaurants_show"
    patch  '/restaurants/:id' => 'restaurants#update',  :as => "restaurants_update"
    delete '/restaurants/:id' => 'restaurants#destroy', :as => "restaurants_destroy"

    get    '/restaurants/:id/:page' => 'restaurants#show',    :as => "restaurants_show_page"

    # customers
    get '/customers/new'      => 'customers#new',  :as => "customers_new"
    get '/customers/:id/edit' => 'customers#edit', :as => "customers_edit"

    post   '/customers'     => 'customers#create',  :as => "customers_create"
    get    '/customers/:id' => 'customers#show',    :as => "customers_show"
    patch  '/customers/:id' => 'customers#update',  :as => "customers_update"
    delete '/customers/:id' => 'customers#destroy', :as => "customers_destroy"

    # Sessions
    get  '/login'      => 'sessions#new',     :as => "sessions_new"
    post '/sessions'   => 'sessions#create',  :as => "sessions_create"
    delete '/sessions' => 'sessions#destroy', :as => "sessions_destroy"

    # reservations
    post '/reservation/:id' => 'reservations#create', :as => "reservations_create"

    # pictures
    post '/pictures/:id' => 'pictures#create', :as => "pictures_create"
    get  '/pictures/:id' => 'pictures#show',   :as => "pictures_show"

    # Comments
    post '/comments/:id' => 'comments#create', :as => "comments_create"

end
