require 'test_helper'

class AcademicUnitiesControllerTest < ActionController::TestCase
  setup do
    @academic_unity = academic_unities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:academic_unities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create academic_unity" do
    assert_difference('AcademicUnity.count') do
      post :create, academic_unity: { address: @academic_unity.address, email: @academic_unity.email, facebook: @academic_unity.facebook, faculty_id: @academic_unity.faculty_id, information: @academic_unity.information, name: @academic_unity.name, twitter: @academic_unity.twitter, url: @academic_unity.url }
    end

    assert_redirected_to academic_unity_path(assigns(:academic_unity))
  end

  test "should show academic_unity" do
    get :show, id: @academic_unity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @academic_unity
    assert_response :success
  end

  test "should update academic_unity" do
    patch :update, id: @academic_unity, academic_unity: { address: @academic_unity.address, email: @academic_unity.email, facebook: @academic_unity.facebook, faculty_id: @academic_unity.faculty_id, information: @academic_unity.information, name: @academic_unity.name, twitter: @academic_unity.twitter, url: @academic_unity.url }
    assert_redirected_to academic_unity_path(assigns(:academic_unity))
  end

  test "should destroy academic_unity" do
    assert_difference('AcademicUnity.count', -1) do
      delete :destroy, id: @academic_unity
    end

    assert_redirected_to academic_unities_path
  end
end
