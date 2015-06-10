class ReservationsController < ApplicationController

	   def create
        @restaurant = Restaurant.find_by(id: params[:id])
        reviewer = Reviewer.find_by(customer_id: @customer.id, restaurant_id: @restaurant.id)

        @reservation = Reservation.new
        @reservation.reviewer_id = reviewer.id
        @reservation.title = params[:title]
        @reservation.content = params[:content]
        @reservation.time_posted = DateTime.now
        
        @reservation.save
        redirect_to restaurants_show_url(@restaurant.id)
    end

end
