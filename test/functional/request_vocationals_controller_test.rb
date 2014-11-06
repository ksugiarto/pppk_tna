require 'test_helper'

class RequestVocationalsControllerTest < ActionController::TestCase
  setup do
    @request_vocational = request_vocationals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_vocationals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_vocational" do
    assert_difference('RequestVocational.count') do
      post :create, request_vocational: { notes: @request_vocational.notes, school_request_id: @request_vocational.school_request_id, vocational_id: @request_vocational.vocational_id }
    end

    assert_redirected_to request_vocational_path(assigns(:request_vocational))
  end

  test "should show request_vocational" do
    get :show, id: @request_vocational
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_vocational
    assert_response :success
  end

  test "should update request_vocational" do
    put :update, id: @request_vocational, request_vocational: { notes: @request_vocational.notes, school_request_id: @request_vocational.school_request_id, vocational_id: @request_vocational.vocational_id }
    assert_redirected_to request_vocational_path(assigns(:request_vocational))
  end

  test "should destroy request_vocational" do
    assert_difference('RequestVocational.count', -1) do
      delete :destroy, id: @request_vocational
    end

    assert_redirected_to request_vocationals_path
  end
end
