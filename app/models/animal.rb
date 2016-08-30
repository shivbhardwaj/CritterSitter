class Animal < ActiveRecord::Base
	has_many :prefences
	has_many :pets
	
end
