require 'test_helper'

class CoolingTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cooling_type = cooling_types(:one)
  end

  test "should get index" do
    get cooling_types_url
    assert_response :success
  end

  test "should get new" do
    get new_cooling_type_url
    assert_response :success
  end

  test "should create cooling_type" do
    assert_difference('CoolingType.count') do
      post cooling_types_url, params: { cooling_type: { name: @cooling_type.name } }
    end

    assert_redirected_to cooling_type_url(CoolingType.last)
  end

  test "should show cooling_type" do
    get cooling_type_url(@cooling_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_cooling_type_url(@cooling_type)
    assert_response :success
  end

  test "should update cooling_type" do
    patch cooling_type_url(@cooling_type), params: { cooling_type: { name: @cooling_type.name } }
    assert_redirected_to cooling_type_url(@cooling_type)
  end

  test "should destroy cooling_type" do
    assert_difference('CoolingType.count', -1) do
      delete cooling_type_url(@cooling_type)
    end

    assert_redirected_to cooling_types_url
  end
end
