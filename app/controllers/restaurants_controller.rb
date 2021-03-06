class RestaurantsController < ApplicationController

    def index
        @restaurants = Restaurant.page(params[:page]).per(9)
        @categories = Category.all
    end

    def show
        @categories = Category.all
        @category = Category.find(params[:id])
        @restaurants = @category.restaurants.page(params[:page]).per(9)
        @comment = Comment.new
    end
    
    def feeds
        @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
        @recent_comments = Comment.order(created_at: :desc).limit(10)
      end

      def dashboard
        @restaurant = Restaurant.find(params[:id])
      end
      def favorite
        @restaurant = Restaurant.find(params[:id])
        @restaurant.favorites.create!(user: current_user)
        redirect_back(fallback_location: root_path)  # 導回上一頁
      end
      def unfavorite
        @restaurant = Restaurant.find(params[:id])
        favorites = Favorite.where(restaurant: @restaurant, user: current_user)
        favorites.destroy_all
        redirect_back(fallback_location: root_path)
      end

      def is_favorited?(user)
        self.favorited_users.include?(user)
      end
end
