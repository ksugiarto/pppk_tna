require 'test_helper'

class CompanyProfilesControllerTest < ActionController::TestCase
  setup do
    @company_profile = company_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_profile" do
    assert_difference('CompanyProfile.count') do
      post :create, company_profile: { address: @company_profile.address, city_id: @company_profile.city_id, full_name: @company_profile.full_name, name: @company_profile.name }
    end

    assert_redirected_to company_profile_path(assigns(:company_profile))
  end

  test "should show company_profile" do
    get :show, id: @company_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_profile
    assert_response :success
  end

  test "should update company_profile" do
    put :update, id: @company_profile, company_profile: { address: @company_profile.address, city_id: @company_profile.city_id, full_name: @company_profile.full_name, name: @company_profile.name }
    assert_redirected_to company_profile_path(assigns(:company_profile))
  end

  test "should destroy company_profile" do
    assert_difference('CompanyProfile.count', -1) do
      delete :destroy, id: @company_profile
    end

    assert_redirected_to company_profiles_path
  end
end
