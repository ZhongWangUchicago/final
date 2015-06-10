class CommentsController < ApplicationController

    def create
        picture = Picture.find_by(id: params[:id])

        comment = Comment.new
        comment.customer_id = @customer.id
        comment.picture_id = picture.id
        comment.content = params[:content]
        comment.time_posted = DateTime.now
        comment.save

        redirect_to restaurants_show_page_url(picture.restaurant, "pictures", :picture_id => picture.id)
    end

end