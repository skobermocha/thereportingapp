require 'test_helper'

class SampleGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sample_group = sample_groups(:one)
  end

  test "should get index" do
    get sample_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_sample_group_url
    assert_response :success
  end

  test "should create sample_group" do
    assert_difference('SampleGroup.count') do
      post sample_groups_url, params: { sample_group: { lot_id_id: @sample_group.lot_id_id, name: @sample_group.name, project_id_id: @sample_group.project_id_id } }
    end

    assert_redirected_to sample_group_url(SampleGroup.last)
  end

  test "should show sample_group" do
    get sample_group_url(@sample_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_sample_group_url(@sample_group)
    assert_response :success
  end

  test "should update sample_group" do
    patch sample_group_url(@sample_group), params: { sample_group: { lot_id_id: @sample_group.lot_id_id, name: @sample_group.name, project_id_id: @sample_group.project_id_id } }
    assert_redirected_to sample_group_url(@sample_group)
  end

  test "should destroy sample_group" do
    assert_difference('SampleGroup.count', -1) do
      delete sample_group_url(@sample_group)
    end

    assert_redirected_to sample_groups_url
  end
end
