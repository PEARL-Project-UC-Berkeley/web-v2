require "test_helper"

class ExperimentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get experiment_index_url
    assert_response :success
  end

  test "should get show" do
    get experiment_show_url
    assert_response :success
  end

  test "should get new" do
    get experiment_new_url
    assert_response :success
  end

  test "should get create" do
    get experiment_create_url
    assert_response :success
  end

  test "should get edit" do
    get experiment_edit_url
    assert_response :success
  end

  test "should get update" do
    get experiment_update_url
    assert_response :success
  end

  test "should get destroy" do
    get experiment_destroy_url
    assert_response :success
  end
end
