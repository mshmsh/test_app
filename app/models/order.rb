class Order < ActiveRecord::Base
	belongs_to :customer
	has_many :line_items
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
		item.cart_id = nil
		line_items << item
		end
	end

end
