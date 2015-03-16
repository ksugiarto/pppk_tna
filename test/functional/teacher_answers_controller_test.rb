require 'test_helper'

class TeacherAnswersControllerTest < ActionController::TestCase
  setup do
    @teacher_answer = teacher_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_answer" do
    assert_difference('TeacherAnswer.count') do
      post :create, teacher_answer: { event_exam_id: @teacher_answer.event_exam_id, score: @teacher_answer.score, teacher_id: @teacher_answer.teacher_id }
    end

    assert_redirected_to teacher_answer_path(assigns(:teacher_answer))
  end

  test "should show teacher_answer" do
    get :show, id: @teacher_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_answer
    assert_response :success
  end

  test "should update teacher_answer" do
    put :update, id: @teacher_answer, teacher_answer: { event_exam_id: @teacher_answer.event_exam_id, score: @teacher_answer.score, teacher_id: @teacher_answer.teacher_id }
    assert_redirected_to teacher_answer_path(assigns(:teacher_answer))
  end

  test "should destroy teacher_answer" do
    assert_difference('TeacherAnswer.count', -1) do
      delete :destroy, id: @teacher_answer
    end

    assert_redirected_to teacher_answers_path
  end
end
