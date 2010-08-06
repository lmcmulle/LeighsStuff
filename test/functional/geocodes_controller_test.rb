require 'test_helper'

class GeocodesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:geocodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create geocode" do
    assert_difference('Geocode.count') do
      post :create, :geocode => { }
    end

    assert_redirected_to geocode_path(assigns(:geocode))
  end

  test "should show geocode" do
    get :show, :id => geocodes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => geocodes(:one).to_param
    assert_response :success
  end

  test "should update geocode" do
    put :update, :id => geocodes(:one).to_param, :geocode => { }
    assert_redirected_to geocode_path(assigns(:geocode))
  end

  test "should destroy geocode" do
    assert_difference('Geocode.count', -1) do
      delete :destroy, :id => geocodes(:one).to_param
    end

    assert_redirected_to geocodes_path
  end
end
