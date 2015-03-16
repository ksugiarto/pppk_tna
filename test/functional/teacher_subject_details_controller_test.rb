require 'test_helper'

class TeacherSubjectDetailsControllerTest < ActionController::TestCase
  setup do
    @teacher_subject_detail = teacher_subject_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_subject_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_subject_detail" do
    assert_difference('TeacherSubjectDetail.count') do
      post :create, teacher_subject_detail: { competent_score: @teacher_subject_detail.competent_score, subject_id: @teacher_subject_detail.subject_id, teacher_subject_id: @teacher_subject_detail.teacher_subject_id }
    end

    assert_redirected_to teacher_subject_detail_path(assigns(:teacher_subject_detail))
  end

  test "should show teacher_subject_detail" do
    get :show, id: @teacher_subject_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_subject_detail
    assert_response :success
  end

  test "should update teacher_subject_detail" do
    put :update, id: @teacher_subject_detail, teacher_subject_detail: { competent_score: @teacher_subject_detail.competent_score, subject_id: @teacher_subject_detail.subject_id, teacher_subject_id: @teacher_subject_detail.teacher_subject_id }
    assert_redirected_to teacher_subject_detail_path(assigns(:teacher_subject_detail))
  end

  test "should destroy teacher_subject_detail" do
    assert_difference('TeacherSubjectDetail.count', -1) do
      delete :destroy, id: @teacher_subject_detail
    end

    assert_redirected_to teacher_subject_details_path
  end
end
