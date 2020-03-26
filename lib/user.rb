class User < ActiveRecord::Base 
    has_many :heroes
end