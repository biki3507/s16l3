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
end
