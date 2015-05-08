class RestaurantsController < ApplicationController

    def index
        @restaurant = Restaurant.all.limit(100)
    end

    def show
        @restaurant = Restaurant.find_by(id: params['id'])
    end

    def new
    end

    def create
        restaurant = Restaurant.new
        restaurant.name = params[:name]
        restaurant.description = params[:description]
        restaurant.save
        redirect_to index_url
    end

    def edit
        @restaurant = Restaurant.find_by(id: params[:id])
    end

    def update
        restaurant = Restaurant.find_by(id: params[:id])
        restaurant.name = params[:name]
        restaurant.description = params[:description]
        restaurant.save
        redirect_to index_url
    end

    def destroy
        restaurant = Restaurant.find_by(id: params[:id])
        restaurant.delete
        redirect_to index_url
    end
end