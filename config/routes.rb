Rails.application.routes.draw do
    resources :categories
  get 'display_cat_prod' => "store#display_cat_prod", as: 'display_cat_prod'
    
  get 'category/:category_id__c' => "store#show", as: 'store_category'

  get 'product/:product_id' => "store#show_prod", as: 'product_show'

   get 'store/about'
   get 'store/case'
   get 'store/prospect'


  resources :advertisements

  get 'admin' => 'admin#index'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  #get "sessions/create"
  #get "sessions/destroy"
  resources :customers
  resources :admins

  resources :orders

  resources :cart_items

  resources :carts

  get "store/index"
  resources :products do
    get :who_bought, on: :member
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'store#index', as: 'store'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
