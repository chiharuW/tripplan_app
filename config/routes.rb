Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

 scope module: :user do
   root 'homes#top'
   get 'customers/about' => 'homes#about', as: 'about'
   get 'customers/mypage' => 'customers#show', as: 'mypage'
   get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    put 'customers/information' => 'customers#update'
   get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    put 'customers/withdraw' => 'customers#withdraw'
   get "search_tag"=>"plans#search_tag"

   resources :plans do
    resource :bookmarks, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resources :important_points, only: [:create, :destroy]
    resources :tags, only: [:index, :show, :destroy]
  end
 end



# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
  get 'top' => 'homes#top', as: 'top'
  get 'customers/:customer_id/plans' => 'plans#index', as: 'customer_plans'
  resources :customers, only: [:index, :show, :edit, :update]
 end




end
