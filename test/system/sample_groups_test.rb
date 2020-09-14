require "application_system_test_case"

class SampleGroupsTest < ApplicationSystemTestCase
  setup do
    @sample_group = sample_groups(:one)
  end

  test "visiting the index" do
    visit sample_groups_url
    assert_selector "h1", text: "Sample Groups"
  end

  test "creating a Sample group" do
    visit sample_groups_url
    click_on "New Sample Group"

    fill_in "Lot id", with: @sample_group.lot_id_id
    fill_in "Name", with: @sample_group.name
    fill_in "Project id", with: @sample_group.project_id_id
    click_on "Create Sample group"

    assert_text "Sample group was successfully created"
    assert_selector "h1", text: "Sample Groups"
  end

  test "updating a Sample group" do
    visit sample_group_url(@sample_group)
    click_on "Edit", match: :first

    fill_in "Lot id", with: @sample_group.lot_id_id
    fill_in "Name", with: @sample_group.name
    fill_in "Project id", with: @sample_group.project_id_id
    click_on "Update Sample group"

    assert_text "Sample group was successfully updated"
    assert_selector "h1", text: "Sample Groups"
  end

  test "destroying a Sample group" do
    visit edit_sample_group_url(@sample_group)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Sample group was successfully destroyed"
  end
end
