class Picture < ActiveRecord::Base

    belongs_to :reviewer

    has_many :comments
    has_one :customer, :through => :reviewer
    has_one :restaurant, :through => :reviewer
    
    validates_presence_of :file_location
end