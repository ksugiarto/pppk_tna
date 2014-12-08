require 'test_helper'

class EventExamsControllerTest < ActionController::TestCase
  setup do
    @event_exam = event_exams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_exams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_exam" do
    assert_difference('EventExam.count') do
      post :create, event_exam: { description: @event_exam.description, event_id: @event_exam.event_id, exam_type: @event_exam.exam_type }
    end

    assert_redirected_to event_exam_path(assigns(:event_exam))
  end

  test "should show event_exam" do
    get :show, id: @event_exam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_exam
    assert_response :success
  end

  test "should update event_exam" do
    put :update, id: @event_exam, event_exam: { description: @event_exam.description, event_id: @event_exam.event_id, exam_type: @event_exam.exam_type }
    assert_redirected_to event_exam_path(assigns(:event_exam))
  end

  test "should destroy event_exam" do
    assert_difference('EventExam.count', -1) do
      delete :destroy, id: @event_exam
    end

    assert_redirected_to event_exams_path
  end
end
