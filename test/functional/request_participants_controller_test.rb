require 'test_helper'

class RequestParticipantsControllerTest < ActionController::TestCase
  setup do
    @request_participant = request_participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_participant" do
    assert_difference('RequestParticipant.count') do
      post :create, request_participant: { notes: @request_participant.notes, school_request_id: @request_participant.school_request_id, teacher_id: @request_participant.teacher_id }
    end

    assert_redirected_to request_participant_path(assigns(:request_participant))
  end

  test "should show request_participant" do
    get :show, id: @request_participant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_participant
    assert_response :success
  end

  test "should update request_participant" do
    put :update, id: @request_participant, request_participant: { notes: @request_participant.notes, school_request_id: @request_participant.school_request_id, teacher_id: @request_participant.teacher_id }
    assert_redirected_to request_participant_path(assigns(:request_participant))
  end

  test "should destroy request_participant" do
    assert_difference('RequestParticipant.count', -1) do
      delete :destroy, id: @request_participant
    end

    assert_redirected_to request_participants_path
  end
end
