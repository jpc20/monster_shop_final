Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id', to: 'merchants#show', as: :merchant
  get '/merchants/:id/edit', to: 'merchants#edit'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'
  get '/merchants/:merchant_id/items', to: 'items#index'

  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show', as: :item
  get '/items/:item_id/reviews/new', to: 'reviews#new', as: :new_item_review
  post '/items/:item_id/reviews', to: 'reviews#create', as: :item_reviews

  get '/reviews/:id/edit', to: 'reviews#edit', as: :edit_review
  patch '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#destroy', as: :review

  get '/cart', to: 'cart#show'
  post '/cart/:item_id', to: 'cart#add_item'
  delete '/cart', to: 'cart#empty'
  patch '/cart/:change/:item_id', to: 'cart#update_quantity'
  delete '/cart/:item_id', to: 'cart#remove_item'

  get '/registration', to: 'users#new', as: :registration

  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update', as: :user
  patch '/user/:id', to: 'users#update'

  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'
  get '/profile/edit_password', to: 'users#edit_password'
  post '/orders', to: 'user/orders#create'
  get '/profile/orders', to: 'user/orders#index'
  get '/profile/orders/:id', to: 'user/orders#show'
  delete '/profile/orders/:id', to: 'user/orders#cancel'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  # namespace :merchant do
  #   get '/', to: 'dashboard#index', as: :dashboard
  #   resources :orders, only: :show
  #   resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  #   put '/items/:id/change_status', to: 'items#change_status'
  #   get '/orders/:id/fulfill/:order_item_id', to: 'orders#fulfill'
  #   resources :discounts
  # end

  get '/merchant', to: 'merchant/dashboard#index', as: :merchant_dashboard
  get '/merchant/orders/id', to: 'merchant/orders#show'
  get '/merchant/items', to: 'merchant/items#index'
  get '/merchant/items/new', to: 'merchant/items#new'
  post '/merchant/items', to: 'merchant/items#create'
  get '/merchant/items/:id/edit', to: 'merchant/items#edit', as: :edit_merchant_item
  patch '/merchant/items/:id', to: 'merchant/items#update'
  put '/merchant/items/:id', to: 'merchant/items#update'
  delete '/merchant/items/:id', to: 'merchant/items#destroy'
  get '/merchant', to: 'merchant/dashboard#index'
  get '/merchant/discounts/new', to: 'merchant/discounts#new', as: :new_merchant_discount
  get '/merchant/orders/:id', to: 'merchant/orders#show'
  get '/merchant/discounts', to: 'merchant/discounts#index', as: :merchant_discount
  get '/merchant/discounts/:id', to: 'merchant/discounts#show'
  patch '/merchant/discounts.:id', to: 'merchant/discounts#update'
  delete '/merchant/discounts/:id', to: 'merchant/discounts#destroy', as: :delete_merchant_discount
  post '/merchant/discounts', to: 'merchant/discounts#create'
  get '/merchant/discounts/:id/edit', to: 'merchant/discounts#edit', as: :edit_merchant_discount
  put '/merchant/items/:id/change_status', to: 'merchant/items#change_status'
  get '/merchant/orders/:id/fulfill/:order_item_id', to: 'merchant/orders#fulfill'

  # namespace :admin do
  #   get '/', to: 'dashboard#index', as: :dashboard
  #   resources :merchants, only: [:show, :update]
  #   resources :users, only: [:index, :show]
  #   patch '/orders/:id/ship', to: 'orders#ship'
  # end

  get '/admin', to: 'admin/dashboard#index', as: :admin_dashboard
  get '/admin/merchants/:id', to: 'admin/merchants#show'
  patch '/admin/merchants/:id', to: 'admin/merchants#update'
  get '/admin/users/:id', to: 'admin/users#show'
  get '/admin/users', to: 'admin/users#index'
  patch '/admin/orders/:id/ship', to: 'admin/orders#ship'
end
