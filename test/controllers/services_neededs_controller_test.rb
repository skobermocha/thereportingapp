require 'test_helper'

class ServicesNeededsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @services_needed = services_neededs(:one)
  end

  test "should get index" do
    get services_neededs_url
    assert_response :success
  end

  test "should get new" do
    get new_services_needed_url
    assert_response :success
  end

  test "should create services_needed" do
    assert_difference('ServicesNeeded.count') do
      post services_neededs_url, params: { services_needed: { service: @services_needed.service, status: @services_needed.status, system: @services_needed.system } }
    end

    assert_redirected_to services_needed_url(ServicesNeeded.last)
  end

  test "should show services_needed" do
    get services_needed_url(@services_needed)
    assert_response :success
  end

  test "should get edit" do
    get edit_services_needed_url(@services_needed)
    assert_response :success
  end

  test "should update services_needed" do
    patch services_needed_url(@services_needed), params: { services_needed: { service: @services_needed.service, status: @services_needed.status, system: @services_needed.system } }
    assert_redirected_to services_needed_url(@services_needed)
  end

  test "should destroy services_needed" do
    assert_difference('ServicesNeeded.count', -1) do
      delete services_needed_url(@services_needed)
    end

    assert_redirected_to services_neededs_url
  end
end
