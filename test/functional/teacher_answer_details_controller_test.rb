require 'test_helper'

class TeacherAnswerDetailsControllerTest < ActionController::TestCase
  setup do
    @teacher_answer_detail = teacher_answer_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_answer_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_answer_detail" do
    assert_difference('TeacherAnswerDetail.count') do
      post :create, teacher_answer_detail: { answer: @teacher_answer_detail.answer, is_correct: @teacher_answer_detail.is_correct, question_id: @teacher_answer_detail.question_id, subject_id: @teacher_answer_detail.subject_id, teacher_answer_id: @teacher_answer_detail.teacher_answer_id }
    end

    assert_redirected_to teacher_answer_detail_path(assigns(:teacher_answer_detail))
  end

  test "should show teacher_answer_detail" do
    get :show, id: @teacher_answer_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_answer_detail
    assert_response :success
  end

  test "should update teacher_answer_detail" do
    put :update, id: @teacher_answer_detail, teacher_answer_detail: { answer: @teacher_answer_detail.answer, is_correct: @teacher_answer_detail.is_correct, question_id: @teacher_answer_detail.question_id, subject_id: @teacher_answer_detail.subject_id, teacher_answer_id: @teacher_answer_detail.teacher_answer_id }
    assert_redirected_to teacher_answer_detail_path(assigns(:teacher_answer_detail))
  end

  test "should destroy teacher_answer_detail" do
    assert_difference('TeacherAnswerDetail.count', -1) do
      delete :destroy, id: @teacher_answer_detail
    end

    assert_redirected_to teacher_answer_details_path
  end
end
