require 'test_helper'

class PlanTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plan_type = plan_types(:one)
  end

  test "should get index" do
    get plan_types_url
    assert_response :success
  end

  test "should get new" do
    get new_plan_type_url
    assert_response :success
  end

  test "should create plan_type" do
    assert_difference('PlanType.count') do
      post plan_types_url, params: { plan_type: { hers: @plan_type.hers, model_test: @plan_type.model_test, name: @plan_type.name, project_id: @plan_type.project_id, xml_store: @plan_type.xml_store } }
    end

    assert_redirected_to plan_type_url(PlanType.last)
  end

  test "should show plan_type" do
    get plan_type_url(@plan_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_plan_type_url(@plan_type)
    assert_response :success
  end

  test "should update plan_type" do
    patch plan_type_url(@plan_type), params: { plan_type: { hers: @plan_type.hers, model_test: @plan_type.model_test, name: @plan_type.name, project_id: @plan_type.project_id, xml_store: @plan_type.xml_store } }
    assert_redirected_to plan_type_url(@plan_type)
  end

  test "should destroy plan_type" do
    assert_difference('PlanType.count', -1) do
      delete plan_type_url(@plan_type)
    end

    assert_redirected_to plan_types_url
  end
end
