class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index 
  	# Add latest products and auction offers here 
  end
  def store 
  end 
  def list
    @count = increment_counter
  	@category = Category.find(params[:id]) 
  	@products = @category.products.paginate(page: params[:page], :per_page => 3)
  end 
  def cart 
  end 
    	 
end
