require 'test_helper'

class JenkinsAppConfigsControllerTest < ActionController::TestCase
  setup do
    @jenkins_app_config = jenkins_app_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jenkins_app_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jenkins_app_config" do
    assert_difference('JenkinsAppConfig.count') do
      post :create, jenkins_app_config: { directory: @jenkins_app_config.directory }
    end

    assert_redirected_to jenkins_app_config_path(assigns(:jenkins_app_config))
  end

  test "should show jenkins_app_config" do
    get :show, id: @jenkins_app_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jenkins_app_config
    assert_response :success
  end

  test "should update jenkins_app_config" do
    patch :update, id: @jenkins_app_config, jenkins_app_config: { directory: @jenkins_app_config.directory }
    assert_redirected_to jenkins_app_config_path(assigns(:jenkins_app_config))
  end

  test "should destroy jenkins_app_config" do
    assert_difference('JenkinsAppConfig.count', -1) do
      delete :destroy, id: @jenkins_app_config
    end

    assert_redirected_to jenkins_app_configs_path
  end
end
