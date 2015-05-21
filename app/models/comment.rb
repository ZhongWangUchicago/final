class Comment < ActiveRecord::Base

    belongs_to :reservations, foreign_key: "restaurant_id", primary_key: "id", foreign_key: "post_id", primary_key: "id"
    belongs_to :customers, foreign_key: "customer_id", primary_key: "id"
    belongs_to :restaurant, foreign_key: "restaurant_id", primary_key: "id"
  
    validates :restaurant, :presence => true
    validates :reservations, :presence => true
	validates :customers, :presence => true

end