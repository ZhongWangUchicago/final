Rails.application.routes.draw do
    
    root  'restaurants#index'

    get '/restaurants/new'      => 'restaurants#new',  :as => "restaurants_new"
    get '/restaurants/:id/edit' => 'restaurants#edit', :as => "restaurants_edit"

    get    '/restaurants'     => 'restaurants#index',   :as => "index"
    post   '/restaurants'     => 'restaurants#create',  :as => "restaurants_create"
    get    '/restaurants/:id' => 'restaurants#show',    :as => "restaurants_show"
    patch  '/restaurants/:id' => 'restaurants#update',  :as => "restaurants_update"
    delete '/restaurants/:id' => 'restaurants#destroy', :as => "restaurants_destroy"

end