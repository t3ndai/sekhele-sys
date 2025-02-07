require "application_system_test_case"

class EmergencyContactsTest < ApplicationSystemTestCase
  setup do
    @emergency_contact = emergency_contacts(:one)
  end

  test "visiting the index" do
    visit emergency_contacts_url
    assert_selector "h1", text: "Emergency contacts"
  end

  test "should create emergency contact" do
    visit emergency_contacts_url
    click_on "New emergency contact"

    fill_in "Addr lin3", with: @emergency_contact.addr_lin3
    fill_in "Addr line1", with: @emergency_contact.addr_line1
    fill_in "Addr line2", with: @emergency_contact.addr_line2
    fill_in "City", with: @emergency_contact.city
    fill_in "Country", with: @emergency_contact.country
    fill_in "Employee", with: @emergency_contact.employee_id
    fill_in "First name", with: @emergency_contact.first_name
    fill_in "Last name", with: @emergency_contact.last_name
    fill_in "Phone1", with: @emergency_contact.phone1
    fill_in "Phone2", with: @emergency_contact.phone2
    fill_in "Postcode", with: @emergency_contact.postcode
    click_on "Create Emergency contact"

    assert_text "Emergency contact was successfully created"
    click_on "Back"
  end

  test "should update Emergency contact" do
    visit emergency_contact_url(@emergency_contact)
    click_on "Edit this emergency contact", match: :first

    fill_in "Addr lin3", with: @emergency_contact.addr_lin3
    fill_in "Addr line1", with: @emergency_contact.addr_line1
    fill_in "Addr line2", with: @emergency_contact.addr_line2
    fill_in "City", with: @emergency_contact.city
    fill_in "Country", with: @emergency_contact.country
    fill_in "Employee", with: @emergency_contact.employee_id
    fill_in "First name", with: @emergency_contact.first_name
    fill_in "Last name", with: @emergency_contact.last_name
    fill_in "Phone1", with: @emergency_contact.phone1
    fill_in "Phone2", with: @emergency_contact.phone2
    fill_in "Postcode", with: @emergency_contact.postcode
    click_on "Update Emergency contact"

    assert_text "Emergency contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Emergency contact" do
    visit emergency_contact_url(@emergency_contact)
    click_on "Destroy this emergency contact", match: :first

    assert_text "Emergency contact was successfully destroyed"
  end
end
