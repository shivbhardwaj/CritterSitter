Rails.application.routes.draw do
  resources :pets

  get 'proposals/create'

  get 'acceptances/create'


  get 'proposals/show'


  post "/acceptances" => "acceptances#create"
  post "/jobs" => "jobs#create"

  get '/owners/:id/show' => 'owners#show'
  post '/proposals' => 'proposals#create'
  post '/remove/:id' => "pets#remove"

  get '/clear' => 'owners#clear'
  get '/login' => 'owners#login'
  post '/owners/login' => 'owners#log'
  post '/sitters/login' => 'sitters#log'
  delete '/sitters' =>'sitters#logout'
  delete '/owners' =>'owners#logout'
  get "/owners/:id/edit" => "owners#edit"

  post "/sitterscreate" => "sitters#create"

  get "sitters/:id/edit" => "sitters#edit"
  root 'owners#index'
  get "owners/oldjobs" => "owners#oldjobs"
  get "sitters/oldjobs" => "sitters#oldjobs"
  post '/owners'=>'owners#create'
  get '/profile/mypets' => 'owners#mypets'
  get "sitters/:id" => "sitters#show"
  patch "sitters/:id" => "sitters#update"
  delete "sitters/:id" => "sitters#destroy"


  patch "owners/:id" => "owners#update"

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
end
