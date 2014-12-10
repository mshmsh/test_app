require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
    @admin = users(:one)
  end

  test "should get index" do
    log_in_as(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test "should get new" do
    log_in_as(@admin)
    get :new
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, cart: {  }
    end
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should show cart" do
    log_in_as(@admin)
    get :show, id: @cart
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@admin)
    get :edit, id: @cart
    assert_response :success
  end

  test "should update cart" do
    patch :update, id: @cart, cart: {  }
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      session[:cart_id] = @cart.id
      delete :destroy, id: @cart
    end

    assert_redirected_to root_path
  end
end
