require 'test_helper'

class CoreCompetenciesControllerTest < ActionController::TestCase
  setup do
    @core_competency = core_competencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:core_competencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create core_competency" do
    assert_difference('CoreCompetency.count') do
      post :create, core_competency: { description: @core_competency.description, vocational_id: @core_competency.vocational_id }
    end

    assert_redirected_to core_competency_path(assigns(:core_competency))
  end

  test "should show core_competency" do
    get :show, id: @core_competency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @core_competency
    assert_response :success
  end

  test "should update core_competency" do
    put :update, id: @core_competency, core_competency: { description: @core_competency.description, vocational_id: @core_competency.vocational_id }
    assert_redirected_to core_competency_path(assigns(:core_competency))
  end

  test "should destroy core_competency" do
    assert_difference('CoreCompetency.count', -1) do
      delete :destroy, id: @core_competency
    end

    assert_redirected_to core_competencies_path
  end
end
