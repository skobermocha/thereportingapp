require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { account_id: @project.account_id, active: @project.active, climate_zone: @project.climate_zone, description: @project.description, file_share: @project.file_share, jurisdiction: @project.jurisdiction, location: @project.location, name: @project.name, project_type: @project.project_type, utility_electricity: @project.utility_electricity, utility_gas: @project.utility_gas, zipcode: @project.zipcode } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { account_id: @project.account_id, active: @project.active, climate_zone: @project.climate_zone, description: @project.description, file_share: @project.file_share, jurisdiction: @project.jurisdiction, location: @project.location, name: @project.name, project_type: @project.project_type, utility_electricity: @project.utility_electricity, utility_gas: @project.utility_gas, zipcode: @project.zipcode } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
