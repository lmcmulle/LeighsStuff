require 'test_helper'

class GeocodingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:geocodings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create geocoding" do
    assert_difference('Geocoding.count') do
      post :create, :geocoding => { }
    end

    assert_redirected_to geocoding_path(assigns(:geocoding))
  end

  test "should show geocoding" do
    get :show, :id => geocodings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => geocodings(:one).to_param
    assert_response :success
  end

  test "should update geocoding" do
    put :update, :id => geocodings(:one).to_param, :geocoding => { }
    assert_redirected_to geocoding_path(assigns(:geocoding))
  end

  test "should destroy geocoding" do
    assert_difference('Geocoding.count', -1) do
      delete :destroy, :id => geocodings(:one).to_param
    end

    assert_redirected_to geocodings_path
  end
end
