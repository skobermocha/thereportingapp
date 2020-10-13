require "application_system_test_case"

class ServicesNeededsTest < ApplicationSystemTestCase
  setup do
    @services_needed = services_neededs(:one)
  end

  test "visiting the index" do
    visit services_neededs_url
    assert_selector "h1", text: "Services Neededs"
  end

  test "creating a Services needed" do
    visit services_neededs_url
    click_on "New Services Needed"

    fill_in "Service", with: @services_needed.service
    fill_in "Status", with: @services_needed.status
    fill_in "System", with: @services_needed.system
    click_on "Create Services needed"

    assert_text "Services needed was successfully created"
    assert_selector "h1", text: "Services Neededs"
  end

  test "updating a Services needed" do
    visit services_needed_url(@services_needed)
    click_on "Edit", match: :first

    fill_in "Service", with: @services_needed.service
    fill_in "Status", with: @services_needed.status
    fill_in "System", with: @services_needed.system
    click_on "Update Services needed"

    assert_text "Services needed was successfully updated"
    assert_selector "h1", text: "Services Neededs"
  end

  test "destroying a Services needed" do
    visit edit_services_needed_url(@services_needed)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Services needed was successfully destroyed"
  end
end
