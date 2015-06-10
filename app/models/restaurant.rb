class Restaurant < ActiveRecord::Base

    has_many :reviewers
    has_many :customers, :through => :reviewers
    has_many :reservations, :through => :reviewers
    has_many :pictures, :through => :reviewers

    validates_presence_of :name
end