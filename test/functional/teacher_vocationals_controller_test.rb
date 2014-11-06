require 'test_helper'

class TeacherVocationalsControllerTest < ActionController::TestCase
  setup do
    @teacher_vocational = teacher_vocationals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_vocationals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_vocational" do
    assert_difference('TeacherVocational.count') do
      post :create, teacher_vocational: { notes: @teacher_vocational.notes, teacher_id: @teacher_vocational.teacher_id, vocational_id: @teacher_vocational.vocational_id }
    end

    assert_redirected_to teacher_vocational_path(assigns(:teacher_vocational))
  end

  test "should show teacher_vocational" do
    get :show, id: @teacher_vocational
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_vocational
    assert_response :success
  end

  test "should update teacher_vocational" do
    put :update, id: @teacher_vocational, teacher_vocational: { notes: @teacher_vocational.notes, teacher_id: @teacher_vocational.teacher_id, vocational_id: @teacher_vocational.vocational_id }
    assert_redirected_to teacher_vocational_path(assigns(:teacher_vocational))
  end

  test "should destroy teacher_vocational" do
    assert_difference('TeacherVocational.count', -1) do
      delete :destroy, id: @teacher_vocational
    end

    assert_redirected_to teacher_vocationals_path
  end
end
