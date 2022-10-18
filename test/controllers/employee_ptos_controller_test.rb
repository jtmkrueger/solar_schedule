require "test_helper"

class EmployeePtosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_pto = employee_ptos(:one)
  end

  test "should get index" do
    get employee_ptos_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_pto_url
    assert_response :success
  end

  test "should create employee_pto" do
    assert_difference("EmployeePto.count") do
      post employee_ptos_url, params: { employee_pto: { employee_id: @employee_pto.employee_id, pto_type: @employee_pto.pto_type, pto_date: @employee_pto.pto_date } }
    end

    assert_redirected_to employee_pto_url(EmployeePto.last)
  end

  test "should show employee_pto" do
    get employee_pto_url(@employee_pto)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_pto_url(@employee_pto)
    assert_response :success
  end

  test "should update employee_pto" do
    patch employee_pto_url(@employee_pto), params: { employee_pto: { employee_id: @employee_pto.employee_id, pto_type: @employee_pto.pto_type, pto_date: @employee_pto.pto_date } }
    assert_redirected_to employee_pto_url(@employee_pto)
  end

  test "should destroy employee_pto" do
    assert_difference("EmployeePto.count", -1) do
      delete employee_pto_url(@employee_pto)
    end

    assert_redirected_to employee_ptos_url
  end
end
