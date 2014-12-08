require 'test_helper'

class EventMattersControllerTest < ActionController::TestCase
  setup do
    @event_matter = event_matters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_matters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_matter" do
    assert_difference('EventMatter.count') do
      post :create, event_matter: { event_id: @event_matter.event_id, notes: @event_matter.notes }
    end

    assert_redirected_to event_matter_path(assigns(:event_matter))
  end

  test "should show event_matter" do
    get :show, id: @event_matter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_matter
    assert_response :success
  end

  test "should update event_matter" do
    put :update, id: @event_matter, event_matter: { event_id: @event_matter.event_id, notes: @event_matter.notes }
    assert_redirected_to event_matter_path(assigns(:event_matter))
  end

  test "should destroy event_matter" do
    assert_difference('EventMatter.count', -1) do
      delete :destroy, id: @event_matter
    end

    assert_redirected_to event_matters_path
  end
end
