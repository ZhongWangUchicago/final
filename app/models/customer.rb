class Customer < ActiveRecord::Base
	
	validates :user_name, :uniqueness => true, :allow_nil => false, :presence => true
	validates :password, :presence => true, :allow_nil => false
	has_many :reservations
	has_many :restaurants, :through => :reservations
	
end