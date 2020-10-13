require "application_system_test_case"

class SystemsTest < ApplicationSystemTestCase
  setup do
    @system = systems(:one)
  end

  test "visiting the index" do
    visit systems_url
    assert_selector "h1", text: "Systems"
  end

  test "creating a System" do
    visit systems_url
    click_on "New System"

    fill_in "Alteration", with: @system.alteration
    fill_in "Name", with: @system.name
    click_on "Create System"

    assert_text "System was successfully created"
    assert_selector "h1", text: "Systems"
  end

  test "updating a System" do
    visit system_url(@system)
    click_on "Edit", match: :first

    fill_in "Alteration", with: @system.alteration
    fill_in "Name", with: @system.name
    click_on "Update System"

    assert_text "System was successfully updated"
    assert_selector "h1", text: "Systems"
  end

  test "destroying a System" do
    visit edit_system_url(@system)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "System was successfully destroyed"
  end
end
