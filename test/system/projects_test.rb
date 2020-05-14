require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Account", with: @project.account_id
    check "Active" if @project.active
    fill_in "Climate zone", with: @project.climate_zone
    fill_in "Description", with: @project.description
    fill_in "File share", with: @project.file_share
    fill_in "Jurisdiction", with: @project.jurisdiction
    fill_in "Location", with: @project.location
    fill_in "Name", with: @project.name
    fill_in "Project type", with: @project.project_type
    fill_in "Utility electricity", with: @project.utility_electricity
    fill_in "Utility gas", with: @project.utility_gas
    fill_in "Zipcode", with: @project.zipcode
    click_on "Create Project"

    assert_text "Project was successfully created"
    assert_selector "h1", text: "Projects"
  end

  test "updating a Project" do
    visit project_url(@project)
    click_on "Edit", match: :first

    fill_in "Account", with: @project.account_id
    check "Active" if @project.active
    fill_in "Climate zone", with: @project.climate_zone
    fill_in "Description", with: @project.description
    fill_in "File share", with: @project.file_share
    fill_in "Jurisdiction", with: @project.jurisdiction
    fill_in "Location", with: @project.location
    fill_in "Name", with: @project.name
    fill_in "Project type", with: @project.project_type
    fill_in "Utility electricity", with: @project.utility_electricity
    fill_in "Utility gas", with: @project.utility_gas
    fill_in "Zipcode", with: @project.zipcode
    click_on "Update Project"

    assert_text "Project was successfully updated"
    assert_selector "h1", text: "Projects"
  end

  test "destroying a Project" do
    visit edit_project_url(@project)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Project was successfully destroyed"
  end
end
