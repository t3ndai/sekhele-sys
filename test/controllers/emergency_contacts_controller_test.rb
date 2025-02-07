require "test_helper"

class EmergencyContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emergency_contact = emergency_contacts(:one)
  end

  test "should get index" do
    get emergency_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_emergency_contact_url
    assert_response :success
  end

  test "should create emergency_contact" do
    assert_difference("EmergencyContact.count") do
      post emergency_contacts_url, params: { emergency_contact: { addr_lin3: @emergency_contact.addr_lin3, addr_line1: @emergency_contact.addr_line1, addr_line2: @emergency_contact.addr_line2, city: @emergency_contact.city, country: @emergency_contact.country, employee_id: @emergency_contact.employee_id, first_name: @emergency_contact.first_name, last_name: @emergency_contact.last_name, phone1: @emergency_contact.phone1, phone2: @emergency_contact.phone2, postcode: @emergency_contact.postcode } }
    end

    assert_redirected_to emergency_contact_url(EmergencyContact.last)
  end

  test "should show emergency_contact" do
    get emergency_contact_url(@emergency_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_emergency_contact_url(@emergency_contact)
    assert_response :success
  end

  test "should update emergency_contact" do
    patch emergency_contact_url(@emergency_contact), params: { emergency_contact: { addr_lin3: @emergency_contact.addr_lin3, addr_line1: @emergency_contact.addr_line1, addr_line2: @emergency_contact.addr_line2, city: @emergency_contact.city, country: @emergency_contact.country, employee_id: @emergency_contact.employee_id, first_name: @emergency_contact.first_name, last_name: @emergency_contact.last_name, phone1: @emergency_contact.phone1, phone2: @emergency_contact.phone2, postcode: @emergency_contact.postcode } }
    assert_redirected_to emergency_contact_url(@emergency_contact)
  end

  test "should destroy emergency_contact" do
    assert_difference("EmergencyContact.count", -1) do
      delete emergency_contact_url(@emergency_contact)
    end

    assert_redirected_to emergency_contacts_url
  end
end
