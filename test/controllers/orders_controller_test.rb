require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
    @admin = users(:one)
    @cart = carts(:one)
  end

  test "should get index" do
    log_in_as(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end
  test "requires item in cart" do
    get :new
    if @cart.line_items.empty?
      assert_redirected_to root_path
      assert_equal flash[:notice], 'Your cart is empty'
    end
  end

  test "should get new" do
    cart = Cart.create
    session[:cart_id] = cart.id
    LineItem.create(:cart => cart, :product => products(:ruby))
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { order_date: @order.order_date, order_num: @order.order_num }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    log_in_as(@admin)
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@admin)
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { order_date: @order.order_date, order_num: @order.order_num }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
