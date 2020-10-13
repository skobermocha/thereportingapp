require "application_system_test_case"

class CoolingTypesTest < ApplicationSystemTestCase
  setup do
    @cooling_type = cooling_types(:one)
  end

  test "visiting the index" do
    visit cooling_types_url
    assert_selector "h1", text: "Cooling Types"
  end

  test "creating a Cooling type" do
    visit cooling_types_url
    click_on "New Cooling Type"

    fill_in "Name", with: @cooling_type.name
    click_on "Create Cooling type"

    assert_text "Cooling type was successfully created"
    assert_selector "h1", text: "Cooling Types"
  end

  test "updating a Cooling type" do
    visit cooling_type_url(@cooling_type)
    click_on "Edit", match: :first

    fill_in "Name", with: @cooling_type.name
    click_on "Update Cooling type"

    assert_text "Cooling type was successfully updated"
    assert_selector "h1", text: "Cooling Types"
  end

  test "destroying a Cooling type" do
    visit edit_cooling_type_url(@cooling_type)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Cooling type was successfully destroyed"
  end
end
