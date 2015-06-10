class Reservation < ActiveRecord::Base
	
	belongs_to :reviewer

	validates_presence_of :title
    validates_presence_of :content
end