class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart, only: [:new, :create]  

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    if @cart.line_items.empty? 
        redirect_to root_url, :notice => "Your cart is empty"
      return
    end
    @customer = Customer.new
    #@order = @customer.orders.build
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @order = @customer.orders.build
    @order.add_line_items_from_cart(@cart)
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil

    respond_to do |format|
      if @customer.save 
        format.html { redirect_to root_url, notice: 'Thank you for your purchase.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new  }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:id, :first_name, :last_name, :email, :address_1, :address_2, :birthday, :customer_num,:pay_type)
    end
end
