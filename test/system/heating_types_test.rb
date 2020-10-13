require "application_system_test_case"

class HeatingTypesTest < ApplicationSystemTestCase
  setup do
    @heating_type = heating_types(:one)
  end

  test "visiting the index" do
    visit heating_types_url
    assert_selector "h1", text: "Heating Types"
  end

  test "creating a Heating type" do
    visit heating_types_url
    click_on "New Heating Type"

    fill_in "Name", with: @heating_type.name
    click_on "Create Heating type"

    assert_text "Heating type was successfully created"
    assert_selector "h1", text: "Heating Types"
  end

  test "updating a Heating type" do
    visit heating_type_url(@heating_type)
    click_on "Edit", match: :first

    fill_in "Name", with: @heating_type.name
    click_on "Update Heating type"

    assert_text "Heating type was successfully updated"
    assert_selector "h1", text: "Heating Types"
  end

  test "destroying a Heating type" do
    visit edit_heating_type_url(@heating_type)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Heating type was successfully destroyed"
  end
end
