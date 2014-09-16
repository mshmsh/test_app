class Product < ActiveRecord::Base
	before_destroy :ensure_not_referenced_by_any_line_item
	belongs_to :category
	has_many :line_items
	has_many :orders , :through => :line_items
	validates :title, :description, :image_url, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
	validates :title, :uniqueness => true
	validates :image_url, :allow_blank => true,
	:format => {:with => %r{\.(gif|jpg|png)}i, :message => 'must be a URL for GIF, JPG or PNG image'}
	scope :sorted, lambda { order("products.title ASC") }
	scope :best_sell, lambda { where('price < ?' , 10.00) }


	# ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.count.zero?
			return true
			else
			errors.add(:base, 'Line Items present' )
			return false
			end
	end
	def self.search(search)
		if search
                                 where("title ilike ?", "%#{search}%")
		else
			Product.all
		end
	end

	end

