require 'test_helper'

class CuricculumsControllerTest < ActionController::TestCase
  setup do
    @curicculum = curicculums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:curicculums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curicculum" do
    assert_difference('Curicculum.count') do
      post :create, curicculum: { description: @curicculum.description }
    end

    assert_redirected_to curicculum_path(assigns(:curicculum))
  end

  test "should show curicculum" do
    get :show, id: @curicculum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @curicculum
    assert_response :success
  end

  test "should update curicculum" do
    put :update, id: @curicculum, curicculum: { description: @curicculum.description }
    assert_redirected_to curicculum_path(assigns(:curicculum))
  end

  test "should destroy curicculum" do
    assert_difference('Curicculum.count', -1) do
      delete :destroy, id: @curicculum
    end

    assert_redirected_to curicculums_path
  end
end
