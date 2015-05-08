class Restaurant < ActiveRecord::Base

    #has_many :customers
    #has_many :reservations, :through => :customers
    has_many :reservations
    has_many :customers, :through => :reservations

end