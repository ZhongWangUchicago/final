class Customer < ActiveRecord::Base

	has_secure_password
	
	validates :email, :uniqueness => true, :allow_nil => false, :presence => true
	validates :password, :presence => true, :allow_nil => false
	
	has_many :reviewers
	has_many :restaurants, :through => :reviewers
	has_many :pictures, :through => :reviewers
	has_many :comments
	
end