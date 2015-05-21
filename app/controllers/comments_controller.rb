class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def create
  	@comment = Comment.new(customer_id: params[:customer_id].to_i,
                 date: Time.new.strftime("%Y-%m-%d %H:%M:%S"),
                 content: params[:content],
                 restaurant_id: session[:user_id])

    if @comment.save
      redirect_to post_url(@comment.customer_id), notice: "Comment Successed!"
    else
      redirect_to post_url(params[:customer_id]), notice: "Comment Failed."
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update content: params[:content]

    redirect_to post_url(@comment.customer_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @customer = Customer.find_by_id(@comment.customer_id)
    @comment.delete

    redirect_to post_url(@customer.id)
  end


end