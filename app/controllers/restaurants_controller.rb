class RestaurantsController < ApplicationController

    before_action :require_customer
    before_action :require_restaurant, :only => [:show, :edit, :update, :destroy]
    before_action :require_reviewer, :only => [:show, :edit, :update, :destroy]
    before_action :require_admin, :only => [:edit, :update, :destroy]

    def require_customer
        if session[:customer_id].blank?
            redirect_to sessions_new_url, notice: "You must log in first!"
            return
        end
        @customer = Customer.find_by(id: session[:customer_id])
        if not @customer
            session.delete(:customer_id)
            redirect_to sessions_new_url, notice: "Customer does not exist."
        end
    end

    def require_restaurant
        @restaurant = Restaurant.find_by(id: params['id'])
        if not @restaurant
            redirect_to restaurants_index_url, notice: "Restaurant does not exist."
        end
    end

    def require_reviewer
        @reviewer = Reviewer.find_by(customer_id: @customer.id, restaurant_id: @restaurant.id)
        if not @reviewer
            redirect_to restaurants_index_url, notice: "You are not a reviewer of the restaurant"
        end
    end

    def admin_status
        return Reviewer.find_by(customer_id: @customer.id, restaurant_id: @restaurant.id).admin
    end

    def require_admin
        if not admin_status
            redirect_to restaurants_index_url, notice: "You are not an admin."
        end
    end

    def index
        @restaurants = @customer.restaurants.limit(100)
    end

    def show
        @admin = admin_status
        @active_page = params[:page] ? params[:page] : "reservations"
        @pages = ["reservations", "pictures", "reviewers", "detail"]
        @reservations = @restaurant.reservations.order(time_posted: :desc).limit(100)
        @pictures = @restaurant.pictures.order(time_posted: :desc).limit(100)
        @picture_id = params[:pictures_id]
    end

    def new
    end

    def create
        restaurant = Restaurant.new
        restaurant.name = params[:name]
        restaurant.description = params[:description]
        restaurant.save

        reviewer = Reviewer.new
        reviewer.restaurant_id = restaurant.id
        reviewer.customer_id = @customer.id
        reviewer.admin = true
        reviewer.save

        redirect_to restaurants_index_url
    end

    def edit
    end

    def update
        @restaurant.name = params[:name]
        @restaurant.description = params[:description]
        @restaurant.save
        redirect_to restaurants_show_url(@restaurant.id)
    end

    def destroy
        @restaurant.delete
        redirect_to restaurants_index_url
    end
end
