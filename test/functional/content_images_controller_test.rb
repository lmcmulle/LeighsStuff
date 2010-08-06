require 'test_helper'

class ContentImagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_image" do
    assert_difference('ContentImage.count') do
      post :create, :content_image => { }
    end

    assert_redirected_to content_image_path(assigns(:content_image))
  end

  test "should show content_image" do
    get :show, :id => content_images(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => content_images(:one).to_param
    assert_response :success
  end

  test "should update content_image" do
    put :update, :id => content_images(:one).to_param, :content_image => { }
    assert_redirected_to content_image_path(assigns(:content_image))
  end

  test "should destroy content_image" do
    assert_difference('ContentImage.count', -1) do
      delete :destroy, :id => content_images(:one).to_param
    end

    assert_redirected_to content_images_path
  end
end
