require 'securerandom'

class PicturesController < ApplicationController

    def show
        picture = Picture.find_by(id: params[:id])
        send_file picture.file_location, type: 'image/png', disposition: 'inline'
    end

    def create
        @restaurant = Restaurant.find_by(id: params[:id])
        reviewer = Reviewer.find_by(customer_id: @customer.id, restaurant_id: @restaurant.id)

        uploaded_io = params[:picture]

        if not uploaded_io
            redirect_to restaurants_show_page_url(@restaurant.id, "pictures"), notice: "Must select picture to upload."
            return
        end

        filename = "#{SecureRandom.hex}.picture"
        filepath = Rails.root.join('public', 'uploads', filename)

        File.open(filepath, 'wb') do |file|
            file.write(uploaded_io.read)
        end

        picture = Picture.new
        picture.reviewer_id = reviewer.id
        picture.time_posted = DateTime.now
        picture.file_location = filepath
        picture.save

        redirect_to restaurants_show_page_url(@restaurant.id, "pictures")
    end

end
