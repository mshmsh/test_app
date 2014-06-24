class Category < ActiveRecord::Base
	has_many :products, :dependent => :destroy
	validates_presence_of :name 
	validates_length_of :name , :maximum => 300
	scope :sorted, lambda { order("categories.name ASC") }

end
