class CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(user_name: params[:user_name], 
      password: params[:password], 
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name])

    if @customer.save
      redirect_to root_url, notice: "Signing up finished!"
    else
      render "new"
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def editpw
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @pw1 = params[:pw1]
    @pw2 = params[:pw2]
    if @pw1.nil? || @pw2.nil? || @pw1.length < 1 || @pw2.length < 1
      redirect_to Customer_url(@customer.id), notice: "Incorrect password"
    elsif @pw1 != @pw2
      redirect_to Customer_url(@customer.id), notice: "Password doed not match"      
    else
    @customer.update 
    email: params[:email],
    password: params[:pw1],
    first_name: params[:first_name],
    ast_name: params[:last_name]

    redirect_to Customer_url(@customer.id), notice: "Change successfully"
    end
  end

  def destroy
    @customer = Customer.find_by_id(params[:id])

    @customer.destroy

    redirect_to signout_url
  end
end