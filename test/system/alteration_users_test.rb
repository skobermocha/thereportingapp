require "application_system_test_case"

class AlterationUsersTest < ApplicationSystemTestCase
  setup do
    @alteration_user = alteration_users(:one)
  end

  test "visiting the index" do
    visit alteration_users_url
    assert_selector "h1", text: "Alteration Users"
  end

  test "creating a Alteration user" do
    visit alteration_users_url
    click_on "New Alteration User"

    fill_in "Account", with: @alteration_user.account_id
    fill_in "Alteration", with: @alteration_user.alteration_id
    click_on "Create Alteration user"

    assert_text "Alteration user was successfully created"
    assert_selector "h1", text: "Alteration Users"
  end

  test "updating a Alteration user" do
    visit alteration_user_url(@alteration_user)
    click_on "Edit", match: :first

    fill_in "Account", with: @alteration_user.account_id
    fill_in "Alteration", with: @alteration_user.alteration_id
    click_on "Update Alteration user"

    assert_text "Alteration user was successfully updated"
    assert_selector "h1", text: "Alteration Users"
  end

  test "destroying a Alteration user" do
    visit edit_alteration_user_url(@alteration_user)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Alteration user was successfully destroyed"
  end
end
