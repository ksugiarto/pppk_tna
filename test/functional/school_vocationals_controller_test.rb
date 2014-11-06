require 'test_helper'

class SchoolVocationalsControllerTest < ActionController::TestCase
  setup do
    @school_vocational = school_vocationals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_vocationals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_vocational" do
    assert_difference('SchoolVocational.count') do
      post :create, school_vocational: { notes: @school_vocational.notes, school_id: @school_vocational.school_id, vocational_id: @school_vocational.vocational_id }
    end

    assert_redirected_to school_vocational_path(assigns(:school_vocational))
  end

  test "should show school_vocational" do
    get :show, id: @school_vocational
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_vocational
    assert_response :success
  end

  test "should update school_vocational" do
    put :update, id: @school_vocational, school_vocational: { notes: @school_vocational.notes, school_id: @school_vocational.school_id, vocational_id: @school_vocational.vocational_id }
    assert_redirected_to school_vocational_path(assigns(:school_vocational))
  end

  test "should destroy school_vocational" do
    assert_difference('SchoolVocational.count', -1) do
      delete :destroy, id: @school_vocational
    end

    assert_redirected_to school_vocationals_path
  end
end
