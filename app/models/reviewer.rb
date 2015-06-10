class Reviewer < ActiveRecord::Base

    belongs_to :restaurant
    belongs_to :customer

    has_many :reservations
    has_many :pictures

end
