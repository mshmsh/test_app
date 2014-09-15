class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
  	     # best_sell is a scope which defined in Product Model
       @products = Product.best_sell
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
