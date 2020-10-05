require "application_system_test_case"

class AlterationsTest < ApplicationSystemTestCase
  setup do
    @alteration = alterations(:one)
  end

  test "visiting the index" do
    visit alterations_url
    assert_selector "h1", text: "Alterations"
  end

  test "creating a Alteration" do
    visit alterations_url
    click_on "New Alteration"

    fill_in "Address", with: @alteration.address
    fill_in "Bedroom count", with: @alteration.bedroom_count
    fill_in "Building type", with: @alteration.building_type
    fill_in "City", with: @alteration.city
    fill_in "Climate zone", with: @alteration.climate_zone
    fill_in "Dwelling unit cfa", with: @alteration.dwelling_unit_cfa
    fill_in "Dwelling unit name", with: @alteration.dwelling_unit_name
    fill_in "Ho email", with: @alteration.ho_email
    fill_in "Ho name", with: @alteration.ho_name
    fill_in "Ho phone", with: @alteration.ho_phone
    fill_in "Jurisdiction", with: @alteration.jurisdiction
    fill_in "Name", with: @alteration.name
    fill_in "Owner", with: @alteration.owner_id
    fill_in "Permit number", with: @alteration.permit_number
    fill_in "Zipcode", with: @alteration.zipcode
    click_on "Create Alteration"

    assert_text "Alteration was successfully created"
    assert_selector "h1", text: "Alterations"
  end

  test "updating a Alteration" do
    visit alteration_url(@alteration)
    click_on "Edit", match: :first

    fill_in "Address", with: @alteration.address
    fill_in "Bedroom count", with: @alteration.bedroom_count
    fill_in "Building type", with: @alteration.building_type
    fill_in "City", with: @alteration.city
    fill_in "Climate zone", with: @alteration.climate_zone
    fill_in "Dwelling unit cfa", with: @alteration.dwelling_unit_cfa
    fill_in "Dwelling unit name", with: @alteration.dwelling_unit_name
    fill_in "Ho email", with: @alteration.ho_email
    fill_in "Ho name", with: @alteration.ho_name
    fill_in "Ho phone", with: @alteration.ho_phone
    fill_in "Jurisdiction", with: @alteration.jurisdiction
    fill_in "Name", with: @alteration.name
    fill_in "Owner", with: @alteration.owner_id
    fill_in "Permit number", with: @alteration.permit_number
    fill_in "Zipcode", with: @alteration.zipcode
    click_on "Update Alteration"

    assert_text "Alteration was successfully updated"
    assert_selector "h1", text: "Alterations"
  end

  test "destroying a Alteration" do
    visit edit_alteration_url(@alteration)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Alteration was successfully destroyed"
  end
end
