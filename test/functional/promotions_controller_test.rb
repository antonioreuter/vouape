require 'test_helper'

class PromotionsControllerTest < ActionController::TestCase
  setup do
    @promotion = promotions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promotions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promotion" do
    assert_difference('Promotion.count') do
      post :create, :promotion => @promotion.attributes
    end

    assert_redirected_to promotion_path(assigns(:promotion))
  end

  test "should show promotion" do
    get :show, :id => @promotion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @promotion.to_param
    assert_response :success
  end

  test "should update promotion" do
    put :update, :id => @promotion.to_param, :promotion => @promotion.attributes
    assert_redirected_to promotion_path(assigns(:promotion))
  end

  test "should destroy promotion" do
    assert_difference('Promotion.count', -1) do
      delete :destroy, :id => @promotion.to_param
    end

    assert_redirected_to promotions_path
  end
end
