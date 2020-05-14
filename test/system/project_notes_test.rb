require "application_system_test_case"

class ProjectNotesTest < ApplicationSystemTestCase
  setup do
    @project_note = project_notes(:one)
  end

  test "visiting the index" do
    visit project_notes_url
    assert_selector "h1", text: "Project Notes"
  end

  test "creating a Project note" do
    visit project_notes_url
    click_on "New Project Note"

    fill_in "Note text", with: @project_note.note_text
    fill_in "Project", with: @project_note.project_id
    fill_in "User", with: @project_note.user_id
    click_on "Create Project note"

    assert_text "Project note was successfully created"
    assert_selector "h1", text: "Project Notes"
  end

  test "updating a Project note" do
    visit project_note_url(@project_note)
    click_on "Edit", match: :first

    fill_in "Note text", with: @project_note.note_text
    fill_in "Project", with: @project_note.project_id
    fill_in "User", with: @project_note.user_id
    click_on "Update Project note"

    assert_text "Project note was successfully updated"
    assert_selector "h1", text: "Project Notes"
  end

  test "destroying a Project note" do
    visit edit_project_note_url(@project_note)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Project note was successfully destroyed"
  end
end
