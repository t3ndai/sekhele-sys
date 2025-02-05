require "application_system_test_case"

class CompanyFilesTest < ApplicationSystemTestCase
  setup do
    @company_file = company_files(:one)
  end

  test "visiting the index" do
    visit company_files_url
    assert_selector "h1", text: "Company files"
  end

  test "should create company file" do
    visit company_files_url
    click_on "New company file"

    fill_in "Document", with: @company_file.document_id
    fill_in "Name", with: @company_file.name
    fill_in "Organization", with: @company_file.organization_id
    click_on "Create Company file"

    assert_text "Company file was successfully created"
    click_on "Back"
  end

  test "should update Company file" do
    visit company_file_url(@company_file)
    click_on "Edit this company file", match: :first

    fill_in "Document", with: @company_file.document_id
    fill_in "Name", with: @company_file.name
    fill_in "Organization", with: @company_file.organization_id
    click_on "Update Company file"

    assert_text "Company file was successfully updated"
    click_on "Back"
  end

  test "should destroy Company file" do
    visit company_file_url(@company_file)
    click_on "Destroy this company file", match: :first

    assert_text "Company file was successfully destroyed"
  end
end
