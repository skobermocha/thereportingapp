require 'test_helper'

class HeatingTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @heating_type = heating_types(:one)
  end

  test "should get index" do
    get heating_types_url
    assert_response :success
  end

  test "should get new" do
    get new_heating_type_url
    assert_response :success
  end

  test "should create heating_type" do
    assert_difference('HeatingType.count') do
      post heating_types_url, params: { heating_type: { name: @heating_type.name } }
    end

    assert_redirected_to heating_type_url(HeatingType.last)
  end

  test "should show heating_type" do
    get heating_type_url(@heating_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_heating_type_url(@heating_type)
    assert_response :success
  end

  test "should update heating_type" do
    patch heating_type_url(@heating_type), params: { heating_type: { name: @heating_type.name } }
    assert_redirected_to heating_type_url(@heating_type)
  end

  test "should destroy heating_type" do
    assert_difference('HeatingType.count', -1) do
      delete heating_type_url(@heating_type)
    end

    assert_redirected_to heating_types_url
  end
end
