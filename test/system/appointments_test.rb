require "application_system_test_case"

class AppointmentsTest < ApplicationSystemTestCase
  setup do
    @appointment = appointments(:one)
  end

  test "visiting the index" do
    visit appointments_url
    assert_selector "h1", text: "Appointments"
  end

  test "creating a Appointment" do
    visit appointments_url
    click_on "New Appointment"

    fill_in "Alteration", with: @appointment.alteration
    fill_in "Contact name", with: @appointment.contact_name
    fill_in "Contact phone", with: @appointment.contact_phone
    fill_in "End time", with: @appointment.end_time
    fill_in "Start time", with: @appointment.start_time
    fill_in "User", with: @appointment.user
    fill_in "User created", with: @appointment.user_created_id
    click_on "Create Appointment"

    assert_text "Appointment was successfully created"
    assert_selector "h1", text: "Appointments"
  end

  test "updating a Appointment" do
    visit appointment_url(@appointment)
    click_on "Edit", match: :first

    fill_in "Alteration", with: @appointment.alteration
    fill_in "Contact name", with: @appointment.contact_name
    fill_in "Contact phone", with: @appointment.contact_phone
    fill_in "End time", with: @appointment.end_time
    fill_in "Start time", with: @appointment.start_time
    fill_in "User", with: @appointment.user
    fill_in "User created", with: @appointment.user_created_id
    click_on "Update Appointment"

    assert_text "Appointment was successfully updated"
    assert_selector "h1", text: "Appointments"
  end

  test "destroying a Appointment" do
    visit edit_appointment_url(@appointment)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Appointment was successfully destroyed"
  end
end
