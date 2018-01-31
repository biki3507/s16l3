Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show]
  resources :categories, only: :show
  resources :restaurants do
    resources :comments
        # 瀏覽所有餐廳的最新動態
        collection do
          get :feeds
        end
    
        # 瀏覽個別餐廳的 Dashboard
        member do
          get :dashboard
        end
  end

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
