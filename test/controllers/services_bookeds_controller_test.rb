require 'test_helper'

class ServicesBookedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @services_booked = services_bookeds(:one)
  end

  test "should get index" do
    get services_bookeds_url
    assert_response :success
  end

  test "should get new" do
    get new_services_booked_url
    assert_response :success
  end

  test "should create services_booked" do
    assert_difference('ServicesBooked.count') do
      post services_bookeds_url, params: { services_booked: { appointment: @services_booked.appointment, price: @services_booked.price, service: @services_booked.service, status: @services_booked.status } }
    end

    assert_redirected_to services_booked_url(ServicesBooked.last)
  end

  test "should show services_booked" do
    get services_booked_url(@services_booked)
    assert_response :success
  end

  test "should get edit" do
    get edit_services_booked_url(@services_booked)
    assert_response :success
  end

  test "should update services_booked" do
    patch services_booked_url(@services_booked), params: { services_booked: { appointment: @services_booked.appointment, price: @services_booked.price, service: @services_booked.service, status: @services_booked.status } }
    assert_redirected_to services_booked_url(@services_booked)
  end

  test "should destroy services_booked" do
    assert_difference('ServicesBooked.count', -1) do
      delete services_booked_url(@services_booked)
    end

    assert_redirected_to services_bookeds_url
  end
end
