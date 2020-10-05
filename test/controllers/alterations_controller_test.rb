require 'test_helper'

class AlterationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alteration = alterations(:one)
  end

  test "should get index" do
    get alterations_url
    assert_response :success
  end

  test "should get new" do
    get new_alteration_url
    assert_response :success
  end

  test "should create alteration" do
    assert_difference('Alteration.count') do
      post alterations_url, params: { alteration: { address: @alteration.address, bedroom_count: @alteration.bedroom_count, building_type: @alteration.building_type, city: @alteration.city, climate_zone: @alteration.climate_zone, dwelling_unit_cfa: @alteration.dwelling_unit_cfa, dwelling_unit_name: @alteration.dwelling_unit_name, ho_email: @alteration.ho_email, ho_name: @alteration.ho_name, ho_phone: @alteration.ho_phone, jurisdiction: @alteration.jurisdiction, name: @alteration.name, owner_id: @alteration.owner_id, permit_number: @alteration.permit_number, zipcode: @alteration.zipcode } }
    end

    assert_redirected_to alteration_url(Alteration.last)
  end

  test "should show alteration" do
    get alteration_url(@alteration)
    assert_response :success
  end

  test "should get edit" do
    get edit_alteration_url(@alteration)
    assert_response :success
  end

  test "should update alteration" do
    patch alteration_url(@alteration), params: { alteration: { address: @alteration.address, bedroom_count: @alteration.bedroom_count, building_type: @alteration.building_type, city: @alteration.city, climate_zone: @alteration.climate_zone, dwelling_unit_cfa: @alteration.dwelling_unit_cfa, dwelling_unit_name: @alteration.dwelling_unit_name, ho_email: @alteration.ho_email, ho_name: @alteration.ho_name, ho_phone: @alteration.ho_phone, jurisdiction: @alteration.jurisdiction, name: @alteration.name, owner_id: @alteration.owner_id, permit_number: @alteration.permit_number, zipcode: @alteration.zipcode } }
    assert_redirected_to alteration_url(@alteration)
  end

  test "should destroy alteration" do
    assert_difference('Alteration.count', -1) do
      delete alteration_url(@alteration)
    end

    assert_redirected_to alterations_url
  end
end
