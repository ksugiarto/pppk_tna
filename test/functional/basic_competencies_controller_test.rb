require 'test_helper'

class BasicCompetenciesControllerTest < ActionController::TestCase
  setup do
    @basic_competency = basic_competencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basic_competencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic_competency" do
    assert_difference('BasicCompetency.count') do
      post :create, basic_competency: { core_competency_id: @basic_competency.core_competency_id, description: @basic_competency.description }
    end

    assert_redirected_to basic_competency_path(assigns(:basic_competency))
  end

  test "should show basic_competency" do
    get :show, id: @basic_competency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basic_competency
    assert_response :success
  end

  test "should update basic_competency" do
    put :update, id: @basic_competency, basic_competency: { core_competency_id: @basic_competency.core_competency_id, description: @basic_competency.description }
    assert_redirected_to basic_competency_path(assigns(:basic_competency))
  end

  test "should destroy basic_competency" do
    assert_difference('BasicCompetency.count', -1) do
      delete :destroy, id: @basic_competency
    end

    assert_redirected_to basic_competencies_path
  end
end
