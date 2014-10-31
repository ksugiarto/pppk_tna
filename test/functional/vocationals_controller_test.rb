require 'test_helper'

class VocationalsControllerTest < ActionController::TestCase
  setup do
    @vocational = vocationals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vocationals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vocational" do
    assert_difference('Vocational.count') do
      post :create, vocational: { class: @vocational.class, curicculum_id: @vocational.curicculum_id, name: @vocational.name }
    end

    assert_redirected_to vocational_path(assigns(:vocational))
  end

  test "should show vocational" do
    get :show, id: @vocational
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vocational
    assert_response :success
  end

  test "should update vocational" do
    put :update, id: @vocational, vocational: { class: @vocational.class, curicculum_id: @vocational.curicculum_id, name: @vocational.name }
    assert_redirected_to vocational_path(assigns(:vocational))
  end

  test "should destroy vocational" do
    assert_difference('Vocational.count', -1) do
      delete :destroy, id: @vocational
    end

    assert_redirected_to vocationals_path
  end
end
