require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
    @admin = users(:one)
    @cart = carts(:one)
  end

  test "should get index" do
    log_in_as(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
    post :create, :product_id => products(:ruby).id
  end

    assert_redirected_to root_path
  end

  test "should show line_item" do
    log_in_as(@admin)
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@admin)
    get :edit, id: @line_item
    assert_response :success
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
          assert_difference('LineItem.count', -1) do
                 if @cart.line_items.count == 1 && @line_item.quantity == 1

          delete :destroy, id: @line_item
     else
        @cart.remove_product(@line_item.product_id)
      end
    end
    assert_redirected_to line_items_path
  end

   test "should create line item via ajax" do
    assert_difference('LineItem.count') do
      xhr :post, :create, product_id: products(:ruby).id
    end

    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#current_item td', /Programming Ruby 1.9/
    end
  end
end
