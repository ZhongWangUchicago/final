class Picture < ActiveRecord::Base

    belongs_to :restaurant, foreign_key: "restaurant_id", primary_key: "id"
    belongs_to :customer, foreign_key: "customer_id", primary_key: "id"
    validates :restaurant, :presence => true
	validates :customer, :presence => true
end