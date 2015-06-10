class Comment < ActiveRecord::Base

    belongs_to :picture
    belongs_to :customer
  
    validates_presence_of :content

end