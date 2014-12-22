class Order < ActiveRecord::Base
	before_create :set_time, :set_number
	belongs_to :user
	has_many :line_items, dependent: :destroy
	has_many :products, through: :line_items

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

	private

	  def set_time
	  	self.order_date = Time.now
	  end

	  def set_number
	  	self.order_num = rand(1000000).to_s
	  end

end
