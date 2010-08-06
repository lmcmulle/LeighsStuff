require 'test_helper'

class StoryImagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:story_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story_image" do
    assert_difference('StoryImage.count') do
      post :create, :story_image => { }
    end

    assert_redirected_to story_image_path(assigns(:story_image))
  end

  test "should show story_image" do
    get :show, :id => story_images(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => story_images(:one).to_param
    assert_response :success
  end

  test "should update story_image" do
    put :update, :id => story_images(:one).to_param, :story_image => { }
    assert_redirected_to story_image_path(assigns(:story_image))
  end

  test "should destroy story_image" do
    assert_difference('StoryImage.count', -1) do
      delete :destroy, :id => story_images(:one).to_param
    end

    assert_redirected_to story_images_path
  end
end
