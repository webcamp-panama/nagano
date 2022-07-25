Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }


  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  root to: 'public/homes#top'

  namespace :public do
    get "/about"=>"homes#about"
    get "/unsubscribe"=>"customers#unsubscribe"
    get "/confirm"=>"customers#confirm"
    patch "/withdrawal"=>"customers#withdrawal"
    resources :items, only: [:index, :show ]
    resources :customers, only: [ :show, :edit, :update]
    resources :cart_items, only: [:index, :update, :new, :destroy, :create ] do
      collection do
        delete 'destroy_all'
      end
    end

    post "orders/confirm"=>"orders#confirm"
    get "orders/complete"=>"orders#complete"
    resources :orders, only: [:new, :show, :create, :index]

    resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    get "/"=>"homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update,]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end