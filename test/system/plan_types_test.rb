require "application_system_test_case"

class PlanTypesTest < ApplicationSystemTestCase
  setup do
    @plan_type = plan_types(:one)
  end

  test "visiting the index" do
    visit plan_types_url
    assert_selector "h1", text: "Plan Types"
  end

  test "creating a Plan type" do
    visit plan_types_url
    click_on "New Plan Type"

    fill_in "Hers", with: @plan_type.hers
    check "Model test" if @plan_type.model_test
    fill_in "Name", with: @plan_type.name
    fill_in "Project", with: @plan_type.project_id
    fill_in "Xml store", with: @plan_type.xml_store
    click_on "Create Plan type"

    assert_text "Plan type was successfully created"
    assert_selector "h1", text: "Plan Types"
  end

  test "updating a Plan type" do
    visit plan_type_url(@plan_type)
    click_on "Edit", match: :first

    fill_in "Hers", with: @plan_type.hers
    check "Model test" if @plan_type.model_test
    fill_in "Name", with: @plan_type.name
    fill_in "Project", with: @plan_type.project_id
    fill_in "Xml store", with: @plan_type.xml_store
    click_on "Update Plan type"

    assert_text "Plan type was successfully updated"
    assert_selector "h1", text: "Plan Types"
  end

  test "destroying a Plan type" do
    visit edit_plan_type_url(@plan_type)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Plan type was successfully destroyed"
  end
end
