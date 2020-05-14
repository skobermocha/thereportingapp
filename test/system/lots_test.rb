require "application_system_test_case"

class LotsTest < ApplicationSystemTestCase
  setup do
    @lot = lots(:one)
  end

  test "visiting the index" do
    visit lots_url
    assert_selector "h1", text: "Lots"
  end

  test "creating a Lot" do
    visit lots_url
    click_on "New Lot"

    fill_in "Address", with: @lot.address
    fill_in "Lot", with: @lot.lot
    fill_in "Permit", with: @lot.permit
    fill_in "Phase", with: @lot.phase
    fill_in "Plan type", with: @lot.plan_type_id
    fill_in "Project", with: @lot.project_id
    click_on "Create Lot"

    assert_text "Lot was successfully created"
    assert_selector "h1", text: "Lots"
  end

  test "updating a Lot" do
    visit lot_url(@lot)
    click_on "Edit", match: :first

    fill_in "Address", with: @lot.address
    fill_in "Lot", with: @lot.lot
    fill_in "Permit", with: @lot.permit
    fill_in "Phase", with: @lot.phase
    fill_in "Plan type", with: @lot.plan_type_id
    fill_in "Project", with: @lot.project_id
    click_on "Update Lot"

    assert_text "Lot was successfully updated"
    assert_selector "h1", text: "Lots"
  end

  test "destroying a Lot" do
    visit edit_lot_url(@lot)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Lot was successfully destroyed"
  end
end
