class SessionsController < ApplicationController

    def new
        if session[:customer_id]
            redirect_to restaurants_index_url
        end
    end

    def create
        customer = Customer.find_by(email: params[:email])
        if customer
            if customer.authenticate(params[:password])
                session["customer_id"] = customer.id
                redirect_to restaurants_index_url
                return
            end
        end
        redirect_to sessions_new_url, notice: "Incorrect email or password."
    end

    def destroy
        session.delete 'customer_id'
        redirect_to sessions_new_url
    end

end
