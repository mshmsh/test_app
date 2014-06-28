class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index 
  	# Add latest products and auction offers here 
  end
  def store 
  end 
  def list
    sleep 1
    @count = increment_counter
  	@category = Category.find(params[:id]) 
  	@products = @category.products.sorted
  end 
  def cart 
  end 
    	 
end
