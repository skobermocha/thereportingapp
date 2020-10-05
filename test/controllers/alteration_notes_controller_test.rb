require 'test_helper'

class AlterationNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alteration_note = alteration_notes(:one)
  end

  test "should get index" do
    get alteration_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_alteration_note_url
    assert_response :success
  end

  test "should create alteration_note" do
    assert_difference('AlterationNote.count') do
      post alteration_notes_url, params: { alteration_note: { alteration_id: @alteration_note.alteration_id, user_id: @alteration_note.user_id } }
    end

    assert_redirected_to alteration_note_url(AlterationNote.last)
  end

  test "should show alteration_note" do
    get alteration_note_url(@alteration_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_alteration_note_url(@alteration_note)
    assert_response :success
  end

  test "should update alteration_note" do
    patch alteration_note_url(@alteration_note), params: { alteration_note: { alteration_id: @alteration_note.alteration_id, user_id: @alteration_note.user_id } }
    assert_redirected_to alteration_note_url(@alteration_note)
  end

  test "should destroy alteration_note" do
    assert_difference('AlterationNote.count', -1) do
      delete alteration_note_url(@alteration_note)
    end

    assert_redirected_to alteration_notes_url
  end
end
