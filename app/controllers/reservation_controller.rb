class ReservationController < ApplicationController
	def index
		  @reservations = Reservation.all
	end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
  	@reservation = Reservation.create(restaurant_id: params[:restaurant_id],
                 customer_id: params[:customer_id],
                 content: params[:content])

    if @reservation.save
      redirect_to root_url, notice: "reservation Created."
    else
      render "new"
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update content: params[:content]

    redirect_to reservation_url(@reservation.id)
  end

  def destroy
    @reservation = Reservation.find_by_id(params[:id])

    @reservation.destroy

    redirect_to root_url
  end


end