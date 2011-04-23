require 'test_helper'

class UserPromotionsControllerTest < ActionController::TestCase
  setup do
    @user_promotion = user_promotions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_promotions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_promotion" do
    assert_difference('UserPromotion.count') do
      post :create, :user_promotion => @user_promotion.attributes
    end

    assert_redirected_to user_promotion_path(assigns(:user_promotion))
  end

  test "should show user_promotion" do
    get :show, :id => @user_promotion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_promotion.to_param
    assert_response :success
  end

  test "should update user_promotion" do
    put :update, :id => @user_promotion.to_param, :user_promotion => @user_promotion.attributes
    assert_redirected_to user_promotion_path(assigns(:user_promotion))
  end

  test "should destroy user_promotion" do
    assert_difference('UserPromotion.count', -1) do
      delete :destroy, :id => @user_promotion.to_param
    end

    assert_redirected_to user_promotions_path
  end
end
