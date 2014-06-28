require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    cart = Cart.create
    session[:cart_id] = cart.id
    LineItem.create(:cart => cart, :product => products(:ruby))
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      @order = @customer.orders.build
      post :create, customer: { address_1: @customer.address_1, address_2: @customer.address_2, birthday: @customer.birthday, customer_num: @customer.customer_num, email: @customer.email, first_name: @customer.first_name, last_name: @customer.last_name, pay_type: @customer.pay_type }
    end

    assert_redirected_to root_path
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { address_1: @customer.address_1, address_2: @customer.address_2, birthday: @customer.birthday, customer_num: @customer.customer_num, email: @customer.email, first_name: @customer.first_name, last_name: @customer.last_name, pay_type: @customer.pay_type }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
  test "requires item in cart" do
      get :new
      assert_redirected_to root_path
      assert_equal flash[:notice], 'Your cart is empty'
      end
end
