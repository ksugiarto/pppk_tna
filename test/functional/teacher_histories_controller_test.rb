require 'test_helper'

class TeacherHistoriesControllerTest < ActionController::TestCase
  setup do
    @teacher_history = teacher_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_history" do
    assert_difference('TeacherHistory.count') do
      post :create, teacher_history: { event_id: @teacher_history.event_id, event_participant_id: @teacher_history.event_participant_id, status: @teacher_history.status, teacher_id: @teacher_history.teacher_id }
    end

    assert_redirected_to teacher_history_path(assigns(:teacher_history))
  end

  test "should show teacher_history" do
    get :show, id: @teacher_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_history
    assert_response :success
  end

  test "should update teacher_history" do
    put :update, id: @teacher_history, teacher_history: { event_id: @teacher_history.event_id, event_participant_id: @teacher_history.event_participant_id, status: @teacher_history.status, teacher_id: @teacher_history.teacher_id }
    assert_redirected_to teacher_history_path(assigns(:teacher_history))
  end

  test "should destroy teacher_history" do
    assert_difference('TeacherHistory.count', -1) do
      delete :destroy, id: @teacher_history
    end

    assert_redirected_to teacher_histories_path
  end
end
