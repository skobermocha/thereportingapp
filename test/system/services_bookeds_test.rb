require "application_system_test_case"

class ServicesBookedsTest < ApplicationSystemTestCase
  setup do
    @services_booked = services_bookeds(:one)
  end

  test "visiting the index" do
    visit services_bookeds_url
    assert_selector "h1", text: "Services Bookeds"
  end

  test "creating a Services booked" do
    visit services_bookeds_url
    click_on "New Services Booked"

    fill_in "Appointment", with: @services_booked.appointment
    fill_in "Price", with: @services_booked.price
    fill_in "Service", with: @services_booked.service
    fill_in "Status", with: @services_booked.status
    click_on "Create Services booked"

    assert_text "Services booked was successfully created"
    assert_selector "h1", text: "Services Bookeds"
  end

  test "updating a Services booked" do
    visit services_booked_url(@services_booked)
    click_on "Edit", match: :first

    fill_in "Appointment", with: @services_booked.appointment
    fill_in "Price", with: @services_booked.price
    fill_in "Service", with: @services_booked.service
    fill_in "Status", with: @services_booked.status
    click_on "Update Services booked"

    assert_text "Services booked was successfully updated"
    assert_selector "h1", text: "Services Bookeds"
  end

  test "destroying a Services booked" do
    visit edit_services_booked_url(@services_booked)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Services booked was successfully destroyed"
  end
end
