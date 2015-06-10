class CustomersController < ApplicationController
 
    before_action :require_customer, :only => [:show, :edit, :update, :destroy]

    def require_customer
        if session[:customer_id].blank?
            redirect_to sessions_login_url, notice: "You must log in first!"
        end

        @customer = Customer.find_by(id: session[:customer_id])
    end

    def show
    end

    def new
    end

    def create
        customer = Customer.new
        customer.first_name = params[:first_name]
        customer.last_name = params[:last_name]
        customer.email = params[:email]
        customer.password = params[:password]

        if customer.invalid?
            redirect_to customers_new_url, notice: customer.errors.messages
            return
        end

        customer.save
        session[:customer_id] = customer.id
        redirect_to restaurants_index_url
    end

    def edit
    end

    def update
    end

    def destroy
    end

end
