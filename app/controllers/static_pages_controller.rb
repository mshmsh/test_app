class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
  	     # There is a scope under the name of best_sell in product model
         @products = Product.search(params[:search]).paginate(page: params[:page], :per_page => 12)
  end
  def store

  end

  def list
        @count = increment_counter
  	  @category = Category.find(params[:id])
  	  @products = @category.products.paginate(page: params[:page], :per_page => 6)
    respond_to do |format|
        format.html
        format.xml { render :xml => @product.to_xml }
        format.yaml { render :text => @product.to_yaml }
        end
  end
  def cart

  end

  def blog

  end

  def about

  end

end
