require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    @teacher = teachers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('Teacher.count') do
      post :create, teacher: { address: @teacher.address, born_date: @teacher.born_date, born_place: @teacher.born_place, city_id: @teacher.city_id, country_id: @teacher.country_id, email: @teacher.email, end_title: @teacher.end_title, first_name: @teacher.first_name, front_title: @teacher.front_title, gender: @teacher.gender, last_name: @teacher.last_name, nip: @teacher.nip, province_id: @teacher.province_id, religion: @teacher.religion, start_teach: @teacher.start_teach }
    end

    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should show teacher" do
    get :show, id: @teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher
    assert_response :success
  end

  test "should update teacher" do
    put :update, id: @teacher, teacher: { address: @teacher.address, born_date: @teacher.born_date, born_place: @teacher.born_place, city_id: @teacher.city_id, country_id: @teacher.country_id, email: @teacher.email, end_title: @teacher.end_title, first_name: @teacher.first_name, front_title: @teacher.front_title, gender: @teacher.gender, last_name: @teacher.last_name, nip: @teacher.nip, province_id: @teacher.province_id, religion: @teacher.religion, start_teach: @teacher.start_teach }
    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should destroy teacher" do
    assert_difference('Teacher.count', -1) do
      delete :destroy, id: @teacher
    end

    assert_redirected_to teachers_path
  end
end
