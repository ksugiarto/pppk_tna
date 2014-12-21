require 'test_helper'

class EventPrerequisitesControllerTest < ActionController::TestCase
  setup do
    @event_prerequisite = event_prerequisites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_prerequisites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_prerequisite" do
    assert_difference('EventPrerequisite.count') do
      post :create, event_prerequisite: { event_id: @event_prerequisite.event_id, max_age: @event_prerequisite.max_age, max_event_count: @event_prerequisite.max_event_count, max_long_teach: @event_prerequisite.max_long_teach, min_age: @event_prerequisite.min_age, min_long_teach: @event_prerequisite.min_long_teach }
    end

    assert_redirected_to event_prerequisite_path(assigns(:event_prerequisite))
  end

  test "should show event_prerequisite" do
    get :show, id: @event_prerequisite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_prerequisite
    assert_response :success
  end

  test "should update event_prerequisite" do
    put :update, id: @event_prerequisite, event_prerequisite: { event_id: @event_prerequisite.event_id, max_age: @event_prerequisite.max_age, max_event_count: @event_prerequisite.max_event_count, max_long_teach: @event_prerequisite.max_long_teach, min_age: @event_prerequisite.min_age, min_long_teach: @event_prerequisite.min_long_teach }
    assert_redirected_to event_prerequisite_path(assigns(:event_prerequisite))
  end

  test "should destroy event_prerequisite" do
    assert_difference('EventPrerequisite.count', -1) do
      delete :destroy, id: @event_prerequisite
    end

    assert_redirected_to event_prerequisites_path
  end
end
