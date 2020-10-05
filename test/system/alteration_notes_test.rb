require "application_system_test_case"

class AlterationNotesTest < ApplicationSystemTestCase
  setup do
    @alteration_note = alteration_notes(:one)
  end

  test "visiting the index" do
    visit alteration_notes_url
    assert_selector "h1", text: "Alteration Notes"
  end

  test "creating a Alteration note" do
    visit alteration_notes_url
    click_on "New Alteration Note"

    fill_in "Alteration", with: @alteration_note.alteration_id
    fill_in "User", with: @alteration_note.user_id
    click_on "Create Alteration note"

    assert_text "Alteration note was successfully created"
    assert_selector "h1", text: "Alteration Notes"
  end

  test "updating a Alteration note" do
    visit alteration_note_url(@alteration_note)
    click_on "Edit", match: :first

    fill_in "Alteration", with: @alteration_note.alteration_id
    fill_in "User", with: @alteration_note.user_id
    click_on "Update Alteration note"

    assert_text "Alteration note was successfully updated"
    assert_selector "h1", text: "Alteration Notes"
  end

  test "destroying a Alteration note" do
    visit edit_alteration_note_url(@alteration_note)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Alteration note was successfully destroyed"
  end
end
