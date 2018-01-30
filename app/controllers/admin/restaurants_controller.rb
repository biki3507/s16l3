class Admin::RestaurantsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

    def index
      @restaurants = Restaurant.page(params[:page]).per(10)
    end

    def new
      @restaurant = Restaurant.new
    end

    def create
      @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        flash[:notice] = 'restaurant was successfully created'
        redirect_to admin_restaurants_path
      else
        flash.now[:alert] = 'restaurant was failed to create'
        render :new
      end
    end

    def show

    end

    def destroy
      @restaurant.destroy
      redirect_to admin_restaurants_path
      flash[:alert] = "restaurant was deleted"
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(
            :name,
            :opening_hours,
            :tel,
            :address,
            :description,
            :image
        )
    end

    def authenticate_admin
      unless current_user.admin?
        flash[:alert] = 'Not allow!'
        redirect_to root_path
      end
    end
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end
