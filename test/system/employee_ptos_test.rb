require "application_system_test_case"

class EmployeePtosTest < ApplicationSystemTestCase
  setup do
    @employee_pto = employee_ptos(:one)
  end

  test "visiting the index" do
    visit employee_ptos_url
    assert_selector "h1", text: "Employee ptos"
  end

  test "should create employee pto" do
    visit employee_ptos_url
    click_on "New employee pto"

    fill_in "Employee", with: @employee_pto.employee_id
    fill_in "End date", with: @employee_pto.end_date
    fill_in "Pto type", with: @employee_pto.pto_type
    fill_in "Start date", with: @employee_pto.start_date
    click_on "Create Employee pto"

    assert_text "Employee pto was successfully created"
    click_on "Back"
  end

  test "should update Employee pto" do
    visit employee_pto_url(@employee_pto)
    click_on "Edit this employee pto", match: :first

    fill_in "Employee", with: @employee_pto.employee_id
    fill_in "End date", with: @employee_pto.end_date
    fill_in "Pto type", with: @employee_pto.pto_type
    fill_in "Start date", with: @employee_pto.start_date
    click_on "Update Employee pto"

    assert_text "Employee pto was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee pto" do
    visit employee_pto_url(@employee_pto)
    click_on "Destroy this employee pto", match: :first

    assert_text "Employee pto was successfully destroyed"
  end
end
