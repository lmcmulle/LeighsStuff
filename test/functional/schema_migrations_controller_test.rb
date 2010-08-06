require 'test_helper'

class SchemaMigrationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schema_migrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schema_migration" do
    assert_difference('SchemaMigration.count') do
      post :create, :schema_migration => { }
    end

    assert_redirected_to schema_migration_path(assigns(:schema_migration))
  end

  test "should show schema_migration" do
    get :show, :id => schema_migrations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => schema_migrations(:one).to_param
    assert_response :success
  end

  test "should update schema_migration" do
    put :update, :id => schema_migrations(:one).to_param, :schema_migration => { }
    assert_redirected_to schema_migration_path(assigns(:schema_migration))
  end

  test "should destroy schema_migration" do
    assert_difference('SchemaMigration.count', -1) do
      delete :destroy, :id => schema_migrations(:one).to_param
    end

    assert_redirected_to schema_migrations_path
  end
end
