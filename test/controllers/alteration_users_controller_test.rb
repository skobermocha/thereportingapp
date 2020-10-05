require 'test_helper'

class AlterationUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alteration_user = alteration_users(:one)
  end

  test "should get index" do
    get alteration_users_url
    assert_response :success
  end

  test "should get new" do
    get new_alteration_user_url
    assert_response :success
  end

  test "should create alteration_user" do
    assert_difference('AlterationUser.count') do
      post alteration_users_url, params: { alteration_user: { account_id: @alteration_user.account_id, alteration_id: @alteration_user.alteration_id } }
    end

    assert_redirected_to alteration_user_url(AlterationUser.last)
  end

  test "should show alteration_user" do
    get alteration_user_url(@alteration_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_alteration_user_url(@alteration_user)
    assert_response :success
  end

  test "should update alteration_user" do
    patch alteration_user_url(@alteration_user), params: { alteration_user: { account_id: @alteration_user.account_id, alteration_id: @alteration_user.alteration_id } }
    assert_redirected_to alteration_user_url(@alteration_user)
  end

  test "should destroy alteration_user" do
    assert_difference('AlterationUser.count', -1) do
      delete alteration_user_url(@alteration_user)
    end

    assert_redirected_to alteration_users_url
  end
end
