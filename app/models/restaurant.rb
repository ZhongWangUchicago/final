class Restaurant < ActiveRecord::Base

    #has_many :customers
    #has_many :reservations, :through => :customers
    validates :rest_name, :uniqueness => true, :allow_nil => false, :presence => true
    has_many :reservations
    has_many :customers, :through => :reservations

end