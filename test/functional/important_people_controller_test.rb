require 'test_helper'

class ImportantPeopleControllerTest < ActionController::TestCase
  setup do
    @important_person = important_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:important_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create important_person" do
    assert_difference('ImportantPerson.count') do
      post :create, important_person: { name: @important_person.name, nip: @important_person.nip, position: @important_person.position }
    end

    assert_redirected_to important_person_path(assigns(:important_person))
  end

  test "should show important_person" do
    get :show, id: @important_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @important_person
    assert_response :success
  end

  test "should update important_person" do
    put :update, id: @important_person, important_person: { name: @important_person.name, nip: @important_person.nip, position: @important_person.position }
    assert_redirected_to important_person_path(assigns(:important_person))
  end

  test "should destroy important_person" do
    assert_difference('ImportantPerson.count', -1) do
      delete :destroy, id: @important_person
    end

    assert_redirected_to important_people_path
  end
end
