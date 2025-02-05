require "test_helper"

class CompanyFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_file = company_files(:one)
  end

  test "should get index" do
    get company_files_url
    assert_response :success
  end

  test "should get new" do
    get new_company_file_url
    assert_response :success
  end

  test "should create company_file" do
    assert_difference("CompanyFile.count") do
      post company_files_url, params: { company_file: { document_id: @company_file.document_id, name: @company_file.name, organization_id: @company_file.organization_id } }
    end

    assert_redirected_to company_file_url(CompanyFile.last)
  end

  test "should show company_file" do
    get company_file_url(@company_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_file_url(@company_file)
    assert_response :success
  end

  test "should update company_file" do
    patch company_file_url(@company_file), params: { company_file: { document_id: @company_file.document_id, name: @company_file.name, organization_id: @company_file.organization_id } }
    assert_redirected_to company_file_url(@company_file)
  end

  test "should destroy company_file" do
    assert_difference("CompanyFile.count", -1) do
      delete company_file_url(@company_file)
    end

    assert_redirected_to company_files_url
  end
end
