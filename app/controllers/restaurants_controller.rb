class RestaurantsController < ApplicationController

    def index
        @restaurants = Restaurant.page(params[:page]).per(9)
        @categories = Category.all
    end

    def show
        @categories = Category.all
        @category = Category.find(params[:id])
        @restaurants = @category.restaurants.page(params[:page]).per(9)
    end
end
