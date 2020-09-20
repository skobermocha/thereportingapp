require "application_system_test_case"

class ProjectUsersTest < ApplicationSystemTestCase
  setup do
    @project_user = project_users(:one)
  end

  test "visiting the index" do
    visit project_users_url
    assert_selector "h1", text: "Project Users"
  end

  test "creating a Project user" do
    visit project_users_url
    click_on "New Project User"

    fill_in "Account id", with: @project_user.account_id
    fill_in "Project id", with: @project_user.project_id
    click_on "Create Project user"

    assert_text "Project user was successfully created"
    assert_selector "h1", text: "Project Users"
  end

  test "updating a Project user" do
    visit project_user_url(@project_user)
    click_on "Edit", match: :first

    fill_in "Account id", with: @project_user.account_id
    fill_in "Project id", with: @project_user.project_id
    click_on "Update Project user"

    assert_text "Project user was successfully updated"
    assert_selector "h1", text: "Project Users"
  end

  test "destroying a Project user" do
    visit edit_project_user_url(@project_user)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Project user was successfully destroyed"
  end
end
