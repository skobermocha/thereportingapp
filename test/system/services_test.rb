require "application_system_test_case"

class ServicesTest < ApplicationSystemTestCase
  setup do
    @service = services(:one)
  end

  test "visiting the index" do
    visit services_url
    assert_selector "h1", text: "Services"
  end

  test "creating a Service" do
    visit services_url
    click_on "New Service"

    check "Active" if @service.active
    fill_in "Duration", with: @service.duration
    fill_in "Name", with: @service.name
    fill_in "Price", with: @service.price
    click_on "Create Service"

    assert_text "Service was successfully created"
    assert_selector "h1", text: "Services"
  end

  test "updating a Service" do
    visit service_url(@service)
    click_on "Edit", match: :first

    check "Active" if @service.active
    fill_in "Duration", with: @service.duration
    fill_in "Name", with: @service.name
    fill_in "Price", with: @service.price
    click_on "Update Service"

    assert_text "Service was successfully updated"
    assert_selector "h1", text: "Services"
  end

  test "destroying a Service" do
    visit edit_service_url(@service)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Service was successfully destroyed"
  end
end
